part of 'dependency_injector.dart';

final List<SingleChildWidget> _providers = [
  Provider<Talker>.value(
    value: Talker(),
  ),
  Provider<FcmPlaygroundDatabase>(
    create: (_) => FcmPlaygroundDatabase(driftDatabase(name: K.databaseName)),
    dispose: (_, db) => db.close(),
  ),
  Provider<FlutterLaunchArguments>.value(
    value: FlutterLaunchArguments(),
  ),
  Provider<ConfigurationService>(
    create: (context) => ConfigurationServiceImpl(
      sharedPreferences: SharedPreferences.getInstance(),
      logger: context.read(),
    ),
  ),
  Provider<FilePickerService>(
    create: (context) => FilePickerServiceImpl(
      filePicker: FilePicker.platform,
      logger: context.read(),
    ),
  ),
  Provider<NotificationService>(
    create: (context) => NotificationServiceImpl(
      messageMapper: const MessageMapperImpl(),
      logger: context.read(),
    ),
  ),
  Provider<db.ProjectService>(
    create: (context) => db.ProjectServiceImpl(
      projectDAO: context.read<FcmPlaygroundDatabase>().projectDAO,
      projectMapper: const ProjectMapperImpl(),
      logger: context.read(),
    ),
  ),
  Provider<ProjectService>(
    create: (context) => ProjectServiceImpl(
      logger: context.read(),
    ),
  ),
];
