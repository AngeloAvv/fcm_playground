part of 'configuration_bloc.dart';

@freezed
class ConfigurationEvent with _$ConfigurationEvent {
  const factory ConfigurationEvent.fetch() = FetchConfigurationEvent;

  const factory ConfigurationEvent.setTheme(ThemeMode theme) =
      SetThemeConfigurationEvent;
}
