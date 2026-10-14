import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Firebase Cloud Messaging Playground'**
  String get appName;

  /// No description provided for @actionImportProject.
  ///
  /// In en, this message translates to:
  /// **'Import Project'**
  String get actionImportProject;

  /// No description provided for @actionYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get actionYes;

  /// No description provided for @actionNo.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get actionNo;

  /// No description provided for @actionOk.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get actionOk;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @actionSend.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get actionSend;

  /// No description provided for @dialogImportServiceAccount.
  ///
  /// In en, this message translates to:
  /// **'Import Service Account'**
  String get dialogImportServiceAccount;

  /// No description provided for @dialogImportedProjectTitle.
  ///
  /// In en, this message translates to:
  /// **'Project Imported'**
  String get dialogImportedProjectTitle;

  /// No description provided for @dialogImportedProjectMessage.
  ///
  /// In en, this message translates to:
  /// **'The project has been imported successfully. You can now start sending messages to your devices.'**
  String get dialogImportedProjectMessage;

  /// No description provided for @dialogErrorImportingProjectTitle.
  ///
  /// In en, this message translates to:
  /// **'Error Importing Project'**
  String get dialogErrorImportingProjectTitle;

  /// No description provided for @dialogErrorImportingProjectMessage.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while importing the project. Please try again.'**
  String get dialogErrorImportingProjectMessage;

  /// No description provided for @dialogRemoveProjectTitle.
  ///
  /// In en, this message translates to:
  /// **'Remove Project'**
  String get dialogRemoveProjectTitle;

  /// No description provided for @dialogRemoveProjectMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove this project? This action cannot be undone.'**
  String get dialogRemoveProjectMessage;

  /// No description provided for @dialogErrorRemovingProjectTitle.
  ///
  /// In en, this message translates to:
  /// **'Error Removing Project'**
  String get dialogErrorRemovingProjectTitle;

  /// No description provided for @dialogErrorRemovingProjectMessage.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while removing the project. Please try again.'**
  String get dialogErrorRemovingProjectMessage;

  /// No description provided for @dialogEditedProjectTitle.
  ///
  /// In en, this message translates to:
  /// **'Project Edited'**
  String get dialogEditedProjectTitle;

  /// No description provided for @dialogEditedProjectMessage.
  ///
  /// In en, this message translates to:
  /// **'The project has been edited successfully.'**
  String get dialogEditedProjectMessage;

  /// No description provided for @dialogErrorEditingProjectTitle.
  ///
  /// In en, this message translates to:
  /// **'Error Editing Project'**
  String get dialogErrorEditingProjectTitle;

  /// No description provided for @dialogErrorEditingProjectMessage.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while editing the project. Please try again.'**
  String get dialogErrorEditingProjectMessage;

  /// No description provided for @dialogSentNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification Sent'**
  String get dialogSentNotificationTitle;

  /// No description provided for @dialogSentNotificationMessage.
  ///
  /// In en, this message translates to:
  /// **'The notification has been sent successfully.'**
  String get dialogSentNotificationMessage;

  /// No description provided for @dialogErrorSendingNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Error Sending Notification'**
  String get dialogErrorSendingNotificationTitle;

  /// No description provided for @dialogErrorSendingNotificationMessage.
  ///
  /// In en, this message translates to:
  /// **'An error occurred while sending the notification. Please try again.'**
  String get dialogErrorSendingNotificationMessage;

  /// No description provided for @errorGeneric.
  ///
  /// In en, this message translates to:
  /// **'An error occurred. Please try again.'**
  String get errorGeneric;

  /// No description provided for @hintNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Insert the title to be displayed in the notification.'**
  String get hintNotificationTitle;

  /// No description provided for @hintNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'Insert the body of the notification.'**
  String get hintNotificationBody;

  /// No description provided for @hintNotificationImage.
  ///
  /// In en, this message translates to:
  /// **'Insert the URL of the image to be displayed in the notification.'**
  String get hintNotificationImage;

  /// No description provided for @hintNotificationToken.
  ///
  /// In en, this message translates to:
  /// **'Insert the token of the device to which the notification will be sent.'**
  String get hintNotificationToken;

  /// No description provided for @hintNotificationTopic.
  ///
  /// In en, this message translates to:
  /// **'Insert the topic to which the notification will be sent.'**
  String get hintNotificationTopic;

  /// No description provided for @hintNotificationData.
  ///
  /// In en, this message translates to:
  /// **'Insert the data to be sent with the notification.'**
  String get hintNotificationData;

  /// No description provided for @hintProjectName.
  ///
  /// In en, this message translates to:
  /// **'Insert the name of the project.'**
  String get hintProjectName;

  /// No description provided for @hintProjectId.
  ///
  /// In en, this message translates to:
  /// **'Insert the ID of the project.'**
  String get hintProjectId;

  /// No description provided for @hintProjectClientId.
  ///
  /// In en, this message translates to:
  /// **'Insert the client ID of the project.'**
  String get hintProjectClientId;

  /// No description provided for @hintProjectPrivateKey.
  ///
  /// In en, this message translates to:
  /// **'Insert the private key of the project.'**
  String get hintProjectPrivateKey;

  /// No description provided for @hintProjectClientEmail.
  ///
  /// In en, this message translates to:
  /// **'Insert the client email of the project.'**
  String get hintProjectClientEmail;

  /// No description provided for @labelLetsBegin.
  ///
  /// In en, this message translates to:
  /// **'Let\'s begin'**
  String get labelLetsBegin;

  /// No description provided for @labelSelectProject.
  ///
  /// In en, this message translates to:
  /// **'Click on the button below to import a Firebase project.'**
  String get labelSelectProject;

  /// No description provided for @labelGenericErrorTitle.
  ///
  /// In en, this message translates to:
  /// **'Uh oh!'**
  String get labelGenericErrorTitle;

  /// No description provided for @labelErrorGettingProject.
  ///
  /// In en, this message translates to:
  /// **'Error getting project. Please try again.'**
  String get labelErrorGettingProject;

  /// No description provided for @labelErrorFetchingProjects.
  ///
  /// In en, this message translates to:
  /// **'Error fetching projects. Please try again.'**
  String get labelErrorFetchingProjects;

  /// Label for the date when the project was created
  ///
  /// In en, this message translates to:
  /// **'Created on {date}'**
  String labelCreatedOn(DateTime date);

  /// No description provided for @labelNotificationTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification Title'**
  String get labelNotificationTitle;

  /// No description provided for @labelNotificationBody.
  ///
  /// In en, this message translates to:
  /// **'Notification Body'**
  String get labelNotificationBody;

  /// No description provided for @labelNotificationImage.
  ///
  /// In en, this message translates to:
  /// **'Notification Image'**
  String get labelNotificationImage;

  /// No description provided for @labelNotificationType.
  ///
  /// In en, this message translates to:
  /// **'Notification Type'**
  String get labelNotificationType;

  /// No description provided for @labelNotificationToken.
  ///
  /// In en, this message translates to:
  /// **'Notification Token'**
  String get labelNotificationToken;

  /// No description provided for @labelNotificationTopic.
  ///
  /// In en, this message translates to:
  /// **'Notification Topic'**
  String get labelNotificationTopic;

  /// No description provided for @labelNotificationData.
  ///
  /// In en, this message translates to:
  /// **'Notification Data'**
  String get labelNotificationData;

  /// No description provided for @labelProjectName.
  ///
  /// In en, this message translates to:
  /// **'Project Name'**
  String get labelProjectName;

  /// No description provided for @labelProjectId.
  ///
  /// In en, this message translates to:
  /// **'Project ID'**
  String get labelProjectId;

  /// No description provided for @labelProjectClientId.
  ///
  /// In en, this message translates to:
  /// **'Project Client ID'**
  String get labelProjectClientId;

  /// No description provided for @labelProjectPrivateKey.
  ///
  /// In en, this message translates to:
  /// **'Project Private Key'**
  String get labelProjectPrivateKey;

  /// No description provided for @labelProjectClientEmail.
  ///
  /// In en, this message translates to:
  /// **'Project Client Email'**
  String get labelProjectClientEmail;

  /// No description provided for @labelToken.
  ///
  /// In en, this message translates to:
  /// **'Token'**
  String get labelToken;

  /// No description provided for @labelTopic.
  ///
  /// In en, this message translates to:
  /// **'Topic'**
  String get labelTopic;

  /// No description provided for @settingsApp.
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get settingsApp;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @titleRecentProjects.
  ///
  /// In en, this message translates to:
  /// **'Recent Projects'**
  String get titleRecentProjects;

  /// No description provided for @titleSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get titleSettings;

  /// No description provided for @validationRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required.'**
  String get validationRequired;

  /// No description provided for @validationInvalidJson.
  ///
  /// In en, this message translates to:
  /// **'This field must be a valid JSON.'**
  String get validationInvalidJson;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
