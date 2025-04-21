import 'package:auto_route/auto_route.dart';
import 'package:fcm_playground/pages/main/main_page.dart';
import 'package:fcm_playground/pages/project/project_page.dart';
import 'package:fcm_playground/pages/edit_project/edit_project_page.dart';
import 'package:fcm_playground/pages/settings/settings_page.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: MainRoute.page),
    AutoRoute(page: ProjectRoute.page),
    AutoRoute(page: EditProjectRoute.page),
    AutoRoute(page: SettingsRoute.page),
  ];
}
