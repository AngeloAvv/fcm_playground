// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Firebase Cloud Messaging Playground';

  @override
  String get actionImportProject => 'Import Project';

  @override
  String get actionYes => 'Yes';

  @override
  String get actionNo => 'No';

  @override
  String get actionOk => 'Ok';

  @override
  String get actionSave => 'Save';

  @override
  String get actionSend => 'Send';

  @override
  String get dialogImportServiceAccount => 'Import Service Account';

  @override
  String get dialogImportedProjectTitle => 'Project Imported';

  @override
  String get dialogImportedProjectMessage =>
      'The project has been imported successfully. You can now start sending messages to your devices.';

  @override
  String get dialogErrorImportingProjectTitle => 'Error Importing Project';

  @override
  String get dialogErrorImportingProjectMessage =>
      'An error occurred while importing the project. Please try again.';

  @override
  String get dialogRemoveProjectTitle => 'Remove Project';

  @override
  String get dialogRemoveProjectMessage =>
      'Are you sure you want to remove this project? This action cannot be undone.';

  @override
  String get dialogErrorRemovingProjectTitle => 'Error Removing Project';

  @override
  String get dialogErrorRemovingProjectMessage =>
      'An error occurred while removing the project. Please try again.';

  @override
  String get dialogEditedProjectTitle => 'Project Edited';

  @override
  String get dialogEditedProjectMessage =>
      'The project has been edited successfully.';

  @override
  String get dialogErrorEditingProjectTitle => 'Error Editing Project';

  @override
  String get dialogErrorEditingProjectMessage =>
      'An error occurred while editing the project. Please try again.';

  @override
  String get dialogSentNotificationTitle => 'Notification Sent';

  @override
  String get dialogSentNotificationMessage =>
      'The notification has been sent successfully.';

  @override
  String get dialogErrorSendingNotificationTitle =>
      'Error Sending Notification';

  @override
  String get dialogErrorSendingNotificationMessage =>
      'An error occurred while sending the notification. Please try again.';

  @override
  String get errorGeneric => 'An error occurred. Please try again.';

  @override
  String get hintNotificationTitle =>
      'Insert the title to be displayed in the notification.';

  @override
  String get hintNotificationBody => 'Insert the body of the notification.';

  @override
  String get hintNotificationImage =>
      'Insert the URL of the image to be displayed in the notification.';

  @override
  String get hintNotificationToken =>
      'Insert the token of the device to which the notification will be sent.';

  @override
  String get hintNotificationTopic =>
      'Insert the topic to which the notification will be sent.';

  @override
  String get hintNotificationData =>
      'Insert the data to be sent with the notification.';

  @override
  String get hintProjectName => 'Insert the name of the project.';

  @override
  String get hintProjectId => 'Insert the ID of the project.';

  @override
  String get hintProjectClientId => 'Insert the client ID of the project.';

  @override
  String get hintProjectPrivateKey => 'Insert the private key of the project.';

  @override
  String get hintProjectClientEmail =>
      'Insert the client email of the project.';

  @override
  String get labelLetsBegin => 'Let\'s begin';

  @override
  String get labelSelectProject =>
      'Click on the button below to import a Firebase project.';

  @override
  String get labelGenericErrorTitle => 'Uh oh!';

  @override
  String get labelErrorGettingProject =>
      'Error getting project. Please try again.';

  @override
  String get labelErrorFetchingProjects =>
      'Error fetching projects. Please try again.';

  @override
  String labelCreatedOn(DateTime date) {
    final intl.DateFormat dateDateFormat = intl.DateFormat.yMd(localeName);
    final String dateString = dateDateFormat.format(date);

    return 'Created on $dateString';
  }

  @override
  String get labelNotificationTitle => 'Notification Title';

  @override
  String get labelNotificationBody => 'Notification Body';

  @override
  String get labelNotificationImage => 'Notification Image';

  @override
  String get labelNotificationType => 'Notification Type';

  @override
  String get labelNotificationToken => 'Notification Token';

  @override
  String get labelNotificationTopic => 'Notification Topic';

  @override
  String get labelNotificationData => 'Notification Data';

  @override
  String get labelProjectName => 'Project Name';

  @override
  String get labelProjectId => 'Project ID';

  @override
  String get labelProjectClientId => 'Project Client ID';

  @override
  String get labelProjectPrivateKey => 'Project Private Key';

  @override
  String get labelProjectClientEmail => 'Project Client Email';

  @override
  String get labelToken => 'Token';

  @override
  String get labelTopic => 'Topic';

  @override
  String get settingsApp => 'App';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeDark => 'Dark';

  @override
  String get themeLight => 'Light';

  @override
  String get titleRecentProjects => 'Recent Projects';

  @override
  String get titleSettings => 'Settings';

  @override
  String get validationRequired => 'This field is required.';

  @override
  String get validationInvalidJson => 'This field must be a valid JSON.';
}
