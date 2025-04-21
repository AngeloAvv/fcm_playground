part of 'file_picker_bloc.dart';

@freezed
sealed class FilePickerEvent with _$FilePickerEvent {
  const factory FilePickerEvent.pickFile({
    @Default(false) bool multiple,
    String? title,
    String? directory,
    @Default([]) List<String> allowedExtensions,
    @Default({}) Map<String, dynamic> parameters,
  }) = PickFilePickerEvent;

  const factory FilePickerEvent.pickFolder({
    String? title,
    String? directory,
    @Default({}) Map<String, dynamic> parameters,
  }) = PickFolderFilePickerEvent;

  const factory FilePickerEvent.save({
    String? title,
    String? name,
    String? directory,
    List<String>? allowedExtensions,
    @Default({}) Map<String, dynamic> parameters,
  }) = SaveFilePickerEvent;

  const factory FilePickerEvent.reset() = ResetFilePickerEvent;
}
