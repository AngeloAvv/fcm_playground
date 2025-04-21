import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:fcm_playground/features/theme/models/enums/theme_mode.dart';
import 'package:fcm_playground/widgets/bottom_sheets/selector_value_sheet.dart';
import 'package:flutter/material.dart' hide Route;

class ThemeSelectorValueSheet extends StatelessWidget {
  final ThemeMode theme;
  final OnSelectedValueChanged<ThemeMode>? onChanged;

  const ThemeSelectorValueSheet(this.theme, {super.key, this.onChanged});

  @override
  Widget build(BuildContext context) => SelectorValueSheet<ThemeMode>(
    title: context.l10n?.settingsTheme,
    values: ThemeMode.values,
    initialValue: theme,
    localizeTitle: (theme) => theme.localizedString(context),
    onSelectedValueChanged: onChanged,
  );
}
