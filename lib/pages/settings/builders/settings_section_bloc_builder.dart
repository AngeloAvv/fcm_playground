import 'package:flutter/material.dart' hide Route;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsSectionBlocBuilder<B extends StateStreamable<S>, S>
    extends AbstractSettingsSection {
  final BlocWidgetBuilder<S> builder;
  final BlocBuilderCondition<S>? buildWhen;

  const SettingsSectionBlocBuilder({
    super.key,
    required this.builder,
    this.buildWhen,
  });

  @override
  Widget build(BuildContext context) => BlocBuilder<B, S>(
        builder: builder,
        buildWhen: buildWhen,
      );
}
