part of 'file_picker_bloc.dart';

@freezed
sealed class FilePickerState with _$FilePickerState {
  const factory FilePickerState.initial() = InitialFilePickerState;

  const factory FilePickerState.pickingFile({
    @Default({}) Map<String, dynamic> parameters,
  }) = PickingFilePickerState;

  const factory FilePickerState.pickedFile(
    List<String> paths, {
    @Default({}) Map<String, dynamic> parameters,
  }) = PickedFilePickerState;

  const factory FilePickerState.canceledPickingFile({
    @Default({}) Map<String, dynamic> parameters,
  }) = CanceledPickingFilePickerState;

  const factory FilePickerState.errorPickingFile(
    LocalizedError error, {
    @Default({}) Map<String, dynamic> parameters,
  }) = ErrorPickingFilePickerState;

  const factory FilePickerState.pickingFolder({
    @Default({}) Map<String, dynamic> parameters,
  }) = PickingFolderFilePickerState;

  const factory FilePickerState.pickedFolder(
    String path, {
    @Default({}) Map<String, dynamic> parameters,
  }) = PickedFolderFilePickerState;

  const factory FilePickerState.canceledPickingFolder({
    @Default({}) Map<String, dynamic> parameters,
  }) = CanceledPickingFolderFilePickerState;

  const factory FilePickerState.errorPickingFolder(
    LocalizedError error, {
    @Default({}) Map<String, dynamic> parameters,
  }) = ErrorPickingFolderFilePickerState;

  const factory FilePickerState.saving({
    @Default({}) Map<String, dynamic> parameters,
  }) = SavingFilePickerState;

  const factory FilePickerState.saved(
    String path, {
    @Default({}) Map<String, dynamic> parameters,
  }) = SavedFilePickerState;

  const factory FilePickerState.canceledSaving({
    @Default({}) Map<String, dynamic> parameters,
  }) = CanceledSavingFilePickerState;

  const factory FilePickerState.errorSaving(
    LocalizedError error, {
    @Default({}) Map<String, dynamic> parameters,
  }) = ErrorSavingFilePickerState;
}
