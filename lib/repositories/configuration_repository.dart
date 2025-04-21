import 'package:fcm_playground/mixins/configuration_helper.dart';
import 'package:fcm_playground/repositories/repository.dart';
import 'package:fcm_playground/services/configuration_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launch_arguments/flutter_launch_arguments.dart';
import 'package:provider/provider.dart';

/// Abstract class of ConfigurationRepository
abstract class ConfigurationRepository {
  Future<String?> get languageCode;

  Future<ThemeMode> get theme;

  Future<void> setTheme(ThemeMode theme);
}

/// Implementation of the base interface ConfigurationRepository
class ConfigurationRepositoryImpl extends Repository
    with ConfigurationHelper
    implements ConfigurationRepository {
  final FlutterLaunchArguments launchArguments;
  final ConfigurationService configurationService;

  const ConfigurationRepositoryImpl({
    required this.launchArguments,
    required this.configurationService,
    required super.logger,
  });

  @override
  Future<String?> get languageCode => safeCode(
        () async {
          try {
            logger.info(
                '[$ConfigurationRepository] Fetching language code configuration');

            final languageCode = await getLanguageCode(launchArguments);

            logger.info(
                '[$ConfigurationRepository] Language code configuration fetched: $languageCode');

            return languageCode;
          } catch (error, stackTrace) {
            logger.error(
                '[$ConfigurationRepository] Error fetching language code configuration',
                error,
                stackTrace);

            rethrow;
          }
        },
      );

  @override
  Future<ThemeMode> get theme => safeCode(
        () async {
      try {
        logger.info('[$ConfigurationRepository] Getting theme');
        final value = await configurationService.theme;
        logger.info('[$ConfigurationRepository] Got theme: $value');
        return value;
      } catch (error, stackTrace) {
        logger.error(
          '[$ConfigurationRepository] Error getting theme',
          error,
          stackTrace,
        );

        rethrow;
      }
    },
  );


  @override
  Future<void> setTheme(ThemeMode theme) => safeCode(
        () async {
      try {
        logger.info('[$ConfigurationRepository] Setting theme to $theme');
        await configurationService.setTheme(theme);
        logger.info('[$ConfigurationRepository] Theme set to $theme');
      } catch (error, stackTrace) {
        logger.error(
          '[$ConfigurationRepository] Error setting theme',
          error,
          stackTrace,
        );

        rethrow;
      }
    },
  );

}

extension ConfigurationRepositoryExtension on BuildContext {
  /// Extension method used to get the [ConfigurationRepository] instance
  ConfigurationRepository get configurationRepository =>
      read<ConfigurationRepository>();
}
