part of 'dependency_injector.dart';

final List<RepositoryProvider> _repositories = [
  RepositoryProvider<ConfigurationRepository>(
    create: (context) => ConfigurationRepositoryImpl(
      launchArguments: context.read(),
      configurationService: context.read(),
      logger: context.read(),
    ),
  ),
  RepositoryProvider<FilePickerRepository>(
    create: (context) => FilePickerRepositoryImpl(
      filePickerService: context.read(),
      logger: context.read(),
    ),
  ),
  RepositoryProvider<NotificationRepository>(
    create: (context) => NotificationRepositoryImpl(
      notificationService: context.read(),
      messageMapper: const MessageMapperImpl(),
      projectMapper: const ProjectMapperImpl(),
      logger: context.read(),
    ),
  ),
  RepositoryProvider<ProjectRepository>(
    create: (context) => ProjectRepositoryImpl(
      projectService: context.read(),
      dbProjectService: context.read(),
      projectMapper: const ProjectMapperImpl(),
      logger: context.read(),
    ),
  ),
];
