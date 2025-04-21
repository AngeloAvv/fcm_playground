import 'dart:async';

import 'package:fcm_playground/errors/generic_error.dart';
import 'package:fcm_playground/repositories/file_picker_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_essentials_kit/flutter_essentials_kit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_picker_bloc.freezed.dart';
part 'file_picker_event.dart';
part 'file_picker_state.dart';

/// The FilePickerBloc
class FilePickerBloc extends Bloc<FilePickerEvent, FilePickerState> {
  final FilePickerRepository filePickerRepository;

  /// Create a new instance of [FilePickerBloc].
  FilePickerBloc({required this.filePickerRepository})
    : super(const FilePickerState.initial()) {
    on<PickFilePickerEvent>(_onPickFile);
    on<PickFolderFilePickerEvent>(_onPickFolder);
    on<SaveFilePickerEvent>(_onSave);
    on<ResetFilePickerEvent>(_onReset);
  }

  /// Method used to add the [PickFileFilePickerEvent] event
  void pickFile({
    bool multiple = false,
    String? title,
    String? directory,
    List<String> allowedExtensions = const [],
    Map<String, dynamic> parameters = const {},
  }) => add(
    FilePickerEvent.pickFile(
      multiple: multiple,
      title: title,
      directory: directory,
      allowedExtensions: allowedExtensions,
      parameters: parameters,
    ),
  );

  /// Method used to add the [PickFolderFilePickerEvent] event
  void pickFolder({
    String? title,
    String? directory,
    Map<String, dynamic> parameters = const {},
  }) => add(
    FilePickerEvent.pickFolder(
      title: title,
      directory: directory,
      parameters: parameters,
    ),
  );

  /// Method used to add the [SaveFilePickerEvent] event
  void save({
    String? title,
    String? name,
    String? directory,
    List<String>? allowedExtensions,
    Map<String, dynamic> parameters = const {},
  }) => add(
    FilePickerEvent.save(
      title: title,
      name: name,
      directory: directory,
      allowedExtensions: allowedExtensions,
      parameters: parameters,
    ),
  );

  /// Method used to add the [ResetFilePickerEvent] event
  void reset() => add(const FilePickerEvent.reset());

  FutureOr<void> _onPickFile(
    PickFilePickerEvent event,
    Emitter<FilePickerState> emit,
  ) async {
    emit(FilePickerState.pickingFile(parameters: event.parameters));

    try {
      final paths = await filePickerRepository.pickFiles(
        multiple: event.multiple,
        title: event.title,
        directory: event.directory,
        allowedExtensions: event.allowedExtensions,
      );

      if (paths != null) {
        emit(FilePickerState.pickedFile(paths, parameters: event.parameters));
      } else {
        emit(FilePickerState.canceledPickingFile(parameters: event.parameters));
      }
    } on LocalizedError catch (error) {
      emit(
        FilePickerState.errorPickingFile(error, parameters: event.parameters),
      );
    } catch (_) {
      emit(
        FilePickerState.errorPickingFile(
          GenericError(),
          parameters: event.parameters,
        ),
      );
    }
  }

  FutureOr<void> _onPickFolder(
    PickFolderFilePickerEvent event,
    Emitter<FilePickerState> emit,
  ) async {
    emit(FilePickerState.pickingFolder(parameters: event.parameters));

    try {
      final path = await filePickerRepository.pickFolder(
        title: event.title,
        directory: event.directory,
      );

      if (path != null) {
        emit(FilePickerState.pickedFolder(path, parameters: event.parameters));
      } else {
        emit(
          FilePickerState.canceledPickingFolder(parameters: event.parameters),
        );
      }
    } on LocalizedError catch (error) {
      emit(
        FilePickerState.errorPickingFolder(error, parameters: event.parameters),
      );
    } catch (_) {
      emit(
        FilePickerState.errorPickingFolder(
          GenericError(),
          parameters: event.parameters,
        ),
      );
    }
  }

  FutureOr<void> _onSave(
    SaveFilePickerEvent event,
    Emitter<FilePickerState> emit,
  ) async {
    emit(FilePickerState.saving(parameters: event.parameters));

    try {
      final path = await filePickerRepository.save(
        title: event.title,
        name: event.name,
        directory: event.directory,
        allowedExtensions: event.allowedExtensions,
      );

      if (path != null) {
        emit(FilePickerState.saved(path));
      } else {
        emit(FilePickerState.canceledSaving(parameters: event.parameters));
      }
    } on LocalizedError catch (error) {
      emit(FilePickerState.errorSaving(error, parameters: event.parameters));
    } catch (_) {
      emit(
        FilePickerState.errorSaving(
          GenericError(),
          parameters: event.parameters,
        ),
      );
    }
  }

  FutureOr<void> _onReset(
    ResetFilePickerEvent event,
    Emitter<FilePickerState> emit,
  ) {
    emit(const FilePickerState.initial());
  }
}

extension FilePickerBlocExtension on BuildContext {
  /// Extension method used to get the [FilePickerBloc] instance
  FilePickerBloc get filePickerBloc => read<FilePickerBloc>();
}
