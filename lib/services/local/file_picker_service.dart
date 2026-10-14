import 'dart:typed_data';

import 'package:fcm_playground/services/service.dart';
import 'package:file_picker/file_picker.dart';

/// Abstract class of FilePickerService
abstract interface class FilePickerService {
  Future<List<String>?> pickFiles({
    bool multiple = false,
    String? title,
    String? directory,
    List<String>? allowedExtensions,
  });

  Future<String?> pickFolder({String? title, String? directory});

  Future<String?> save({
    required String name,
    required Uint8List bytes,
    String? title,
    String? directory,
    List<String>? allowedExtensions,
  });
}

/// Implementation of the base interface FilePickerService
class FilePickerServiceImpl extends Service implements FilePickerService {
  const FilePickerServiceImpl({required super.logger});

  @override
  Future<List<String>?> pickFiles({
    bool multiple = false,
    String? title,
    String? directory,
    List<String>? allowedExtensions,
  }) async {
    try {
      logger.debug('[$FilePickerService] Picking files...');

      final result = multiple
          ? await FilePicker.pickFiles(
              dialogTitle: title,
              initialDirectory: directory,
              allowedExtensions: allowedExtensions,
              type: FileType.custom,
            )
          : [
              ?await FilePicker.pickFile(
                dialogTitle: title,
                initialDirectory: directory,
                allowedExtensions: allowedExtensions,
                type: FileType.custom,
              ),
            ];

      logger.debug('[$FilePickerService] Picked files: $result');

      final paths = result.map((file) => file.path).nonNulls.toList();

      return paths.isEmpty ? null : paths;
    } catch (error, stackTrace) {
      logger.error(
        '[$FilePickerService] Error picking files',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Future<String?> pickFolder({String? title, String? directory}) async {
    try {
      logger.debug('[$FilePickerService] Picking folder...');

      final result = await FilePicker.getDirectoryPath(
        dialogTitle: title,
        initialDirectory: directory,
      );

      logger.debug('[$FilePickerService] Picked folder: $result');

      return result;
    } catch (error, stackTrace) {
      logger.error(
        '[$FilePickerService] Error picking folder',
        error,
        stackTrace,
      );

      rethrow;
    }
  }

  @override
  Future<String?> save({
    required String name,
    required Uint8List bytes,
    String? title,
    String? directory,
    List<String>? allowedExtensions,
  }) async {
    try {
      logger.debug('[$FilePickerService] Saving file...');

      final uri = await FilePicker.saveFile(
        dialogTitle: title,
        fileName: name,
        bytes: bytes,
        initialDirectory: directory,
        allowedExtensions: allowedExtensions,
        type: FileType.custom,
      );

      logger.debug('[$FilePickerService] Saved file: $uri');

      return uri?.toFilePath();
    } catch (error, stackTrace) {
      logger.error('[$FilePickerService] Error saving file', error, stackTrace);

      rethrow;
    }
  }
}
