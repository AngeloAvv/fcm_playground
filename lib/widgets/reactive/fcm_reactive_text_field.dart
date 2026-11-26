import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FcmReactiveTextField<T> extends ReactiveFocusableFormField<T, String> {
  FcmReactiveTextField({
    required String formControlName,
    String? label,
    Key? textFieldKey,
    TextInputType? keyboardType,
    TextStyle? style,
    TextInputAction? textInputAction,
    ReactiveFormFieldCallback<T>? onSubmitted,
    InputDecoration decoration = const InputDecoration(),
    bool autocorrect = true,
    bool obscureText = false,
    bool showErrors = true,
    bool readOnly = false,
    List<TextInputFormatter> inputFormatters = const [],
    TextCapitalization textCapitalization = TextCapitalization.none,
    EdgeInsets padding = EdgeInsets.zero,
    bool autofocus = false,
    int? minLines,
    int? maxLines = 1,
    super.validationMessages,
    super.valueAccessor,
    super.key,
  }) : super(
         formControlName: formControlName,
         showErrors: !showErrors ? (_) => false : null,
         builder: (field) {
           final state = field as _FcmReactiveTextFieldState<T>;
           final effectiveDecoration = decoration.applyDefaults(
             Theme.of(field.context).inputDecorationTheme,
           );

           return Padding(
             padding: padding,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 if (label != null)
                   Padding(
                     padding: const EdgeInsets.only(bottom: 4.0),
                     child: Text(
                       label,
                       style: Theme.of(field.context).textTheme.titleMedium,
                     ),
                   ),
                 TextField(
                   key: textFieldKey,
                   controller: state._textController,
                   focusNode: field.focusNode,
                   decoration: effectiveDecoration.copyWith(
                     errorText: field.errorText,
                   ),
                   autofocus: autofocus,
                   keyboardType: keyboardType,
                   textInputAction: textInputAction,
                   style: style,
                   textCapitalization: textCapitalization,
                   readOnly: readOnly,
                   obscureText: obscureText,
                   autocorrect: autocorrect,
                   minLines: minLines,
                   maxLines: maxLines,
                   inputFormatters: inputFormatters,
                   enabled: field.control.enabled,
                   onSubmitted:
                       onSubmitted != null
                           ? (_) => onSubmitted(field.control)
                           : null,
                   onChanged: field.didChange,
                 ),
               ],
             ),
           );
         },
       );

  @override
  ReactiveFormFieldState<T, String> createState() =>
      _FcmReactiveTextFieldState<T>();
}

class _FcmReactiveTextFieldState<T>
    extends ReactiveFocusableFormFieldState<T, String> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();

    _textController = TextEditingController(text: value?.toString() ?? '');
  }

  @override
  void onControlValueChanged(dynamic value) {
    final effectiveValue = value == null ? '' : value.toString();
    _textController.value = _textController.value.copyWith(
      text: effectiveValue,
      selection: TextSelection.collapsed(offset: effectiveValue.length),
      composing: TextRange.empty,
    );

    super.onControlValueChanged(value);
  }

  @override
  void dispose() {
    _textController.dispose();

    super.dispose();
  }
}
