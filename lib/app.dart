// Openapi Generator last run: : 2025-04-14T17:09:30.196488
import 'package:fcm_playground/di/dependency_injector.dart';
import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:fcm_playground/features/routing/app_router.dart';
import 'package:fcm_playground/features/theme/widgets/theme_selector.dart';
import 'package:fcm_playground/widgets/reactive/reactive_forms_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'features/theme/models/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  AppRouter? _router;

  @override
  Widget build(BuildContext context) => DependencyInjector(
    child: ThemeSelector(
      builder: (context, mode) {
        _router ??= AppRouter();

        return MaterialApp.router(
          onGenerateTitle: (context) => context.l10n?.appName ?? 'appName',
          debugShowCheckedModeBanner: false,
          routeInformationParser: _router!.defaultRouteParser(),
          routerDelegate: _router!.delegate(),
          theme: LightTheme.make,
          darkTheme: DarkTheme.make,
          themeMode: mode,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: [...AppLocalizations.localizationsDelegates],
          builder: (context, child) => ReactiveFormsConfig(child: child),
        );
      },
    ),
  );
}
