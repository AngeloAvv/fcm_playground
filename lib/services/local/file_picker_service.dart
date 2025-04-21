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
    String? title,
    String? name,
    String? directory,
    List<String>? allowedExtensions,
  });
}

/// Implementation of the base interface FilePickerService
class FilePickerServiceImpl extends Service implements FilePickerService {
  final FilePicker filePicker;

  const FilePickerServiceImpl({
    required this.filePicker,
    required super.logger,
  });

  @override
  Future<List<String>?> pickFiles({
    bool multiple = false,
    String? title,
    String? directory,
    List<String>? allowedExtensions,
  }) async {
    try {
      logger.debug('[$FilePickerService] Picking files...');

      final result = await filePicker.pickFiles(
        dialogTitle: title,
        initialDirectory: directory,
        allowMultiple: multiple,
        allowedExtensions: allowedExtensions,
        type: FileType.custom,
      );

      logger.debug('[$FilePickerService] Picked files: $result');

      return result?.paths.nonNulls.toList(growable: false);
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

      final result = await filePicker.getDirectoryPath(
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
    String? title,
    String? name,
    String? directory,
    List<String>? allowedExtensions,
  }) async {
    try {
      logger.debug('[$FilePickerService] Saving file...');

      final result = await filePicker.saveFile(
        dialogTitle: title,
        fileName: name,
        initialDirectory: directory,
        allowedExtensions: allowedExtensions,
        type: FileType.custom,
      );

      logger.debug('[$FilePickerService] Saved file: $result');

      return result;
    } catch (error, stackTrace) {
      logger.error('[$FilePickerService] Error saving file', error, stackTrace);

      rethrow;
    }
  }
}
