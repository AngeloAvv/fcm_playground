import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:flutter/material.dart';

extension ThemeExtensions on ThemeMode {
  String? localizedString(BuildContext context) {
    switch (this) {
      case ThemeMode.system:
        return context.l10n?.themeSystem ?? 'themeSystem';
      case ThemeMode.dark:
        return context.l10n?.themeDark ?? 'themeDark';
      case ThemeMode.light:
        return context.l10n?.themeLight ?? 'themeLight';
    }
  }
}
