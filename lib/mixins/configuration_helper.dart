import 'package:flutter_launch_arguments/flutter_launch_arguments.dart';

mixin class ConfigurationHelper {
  static const _languageCodeKey = 'languageCode';

  const ConfigurationHelper();

  Future<String?> getLanguageCode(
      [FlutterLaunchArguments? launchArguments]) async {
    final languageCode = const String.fromEnvironment(_languageCodeKey);

    if (languageCode.isNotEmpty) {
      return languageCode;
    }

    return await launchArguments?.getString(_languageCodeKey);
  }
}
