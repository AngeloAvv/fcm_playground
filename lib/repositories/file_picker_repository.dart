import 'package:fcm_playground/repositories/repository.dart';
import 'package:fcm_playground/services/local/file_picker_service.dart';

/// Abstract class of FilePickerRepository
abstract interface class FilePickerRepository {
  Future<List<String>?> pickFiles({
    bool multiple = false,
    String? title,
    String? directory,
    List<String>? allowedExtensions,
  });

  Future<String?> pickFolder({
    String? title,
    String? directory,
  });

  Future<String?> save({
    String? title,
    String? name,
    String? directory,
    List<String>? allowedExtensions,
  });
}

/// Implementation of the base interface FilePickerRepository
class FilePickerRepositoryImpl extends Repository
    implements FilePickerRepository {
  final FilePickerService filePickerService;

  const FilePickerRepositoryImpl({
    required this.filePickerService,
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

      final result = await filePickerService.pickFiles(
        title: title,
        directory: directory,
        multiple: multiple,
        allowedExtensions: allowedExtensions,
      );

      logger.debug('[$FilePickerService] Picked files: $result');

      return result;
    } catch (error, stackTrace) {
      logger.error(
          '[$FilePickerService] Error picking files', error, stackTrace);

      rethrow;
    }
  }

  @override
  Future<String?> pickFolder({
    String? title,
    String? directory,
  }) async {
    try {
      logger.debug('[$FilePickerService] Picking folder...');

      final result = await filePickerService.pickFolder(
        title: title,
        directory: directory,
      );

      logger.debug('[$FilePickerService] Picked folder: $result');

      return result;
    } catch (error, stackTrace) {
      logger.error(
          '[$FilePickerService] Error picking folder', error, stackTrace);

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

      final result = await filePickerService.save(
        title: title,
        name: name,
        directory: directory,
        allowedExtensions: allowedExtensions,
      );

      logger.debug('[$FilePickerService] Saved file: $result');

      return result;
    } catch (error, stackTrace) {
      logger.error('[$FilePickerService] Error saving file', error, stackTrace);

      rethrow;
    }
  }
}
