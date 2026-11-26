import 'package:material_ui/material_ui.dart';
import 'package:fcm_playground/features/localization/generated/app_localizations.dart';

extension BuildContextLocalizations on BuildContext {
  AppLocalizations? get l10n => AppLocalizations.of(this);
}
