import 'dart:convert';

import 'package:googleapis_auth/auth_io.dart';
import 'package:pine/pine.dart';

class ServiceAccountCredentialsDTO extends ServiceAccountCredentials
    implements DTO {
  final String projectId;

  /// Creates a new [ServiceAccountCredentialsDTO] from JSON.
  ///
  /// [json] can be either a [Map] or a JSON map encoded as a [String].
  ///
  /// The optional named argument [impersonatedUser] is used to set the user
  /// to impersonate if impersonating a user.
  factory ServiceAccountCredentialsDTO.fromJson(
    Object? json, {
    String? impersonatedUser,
  }) {
    if (json is String) {
      json = jsonDecode(json);
    }
    if (json is! Map) {
      throw ArgumentError('json must be a Map or a String encoding a Map.');
    }
    final projectId = json['project_id'] as String?;
    final identifier = json['client_id'] as String?;
    final privateKey = json['private_key'] as String?;
    final email = json['client_email'] as String?;
    final type = json['type'];

    if (type != 'service_account') {
      throw ArgumentError(
        'The given credentials are not of type '
        'service_account (was: $type).',
      );
    }

    if (projectId == null ||
        identifier == null ||
        privateKey == null ||
        email == null) {
      throw ArgumentError(
        'The given credentials do not contain all the '
        'fields: project_id, client_id, private_key and client_email.',
      );
    }

    final clientId = ClientId(identifier);
    return ServiceAccountCredentialsDTO(
      email,
      projectId,
      clientId,
      privateKey,
      impersonatedUser: impersonatedUser,
    );
  }

  /// Creates a new [ServiceAccountCredentialsDTO].
  ///
  /// [email] is the e-mail address of the service account.
  ///
  /// [projectId] is the project ID of the service account.
  ///
  /// [clientId] is the client ID for the service account.
  ///
  /// [privateKey] is the base 64 encoded, unencrypted private key, including
  /// the '-----BEGIN PRIVATE KEY-----' and '-----END PRIVATE KEY-----'
  /// boundaries.
  ///
  /// The optional named argument [impersonatedUser] is used to set the user
  /// to impersonate if impersonating a user is needed.
  ServiceAccountCredentialsDTO(
    super.email,
    this.projectId,
    super.clientId,
    super.privateKey, {
    super.impersonatedUser,
  });
}
