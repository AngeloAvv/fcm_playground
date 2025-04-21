import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_essentials_kit/flutter_essentials_kit.dart';
import 'package:json_text_field/json_text_field.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FcmReactiveJsonField
    extends ReactiveFormField<Map<String, String>, String> {
  static const invalid = 'invalid';

  FcmReactiveJsonField({
    required super.formControlName,
    super.validationMessages,
    super.showErrors,
    super.key,
    Key? textFieldKey,
    TextInputType? keyboardType = TextInputType.multiline,
    String? label,
    TextStyle? style,
    TextInputAction? textInputAction,
    InputDecoration decoration = const InputDecoration(),
    bool autocorrect = true,
    bool obscureText = false,
    bool readOnly = false,
    List<TextInputFormatter> inputFormatters = const [],
    TextCapitalization textCapitalization = TextCapitalization.none,
    EdgeInsets padding = EdgeInsets.zero,
    bool autofocus = false,
    bool expands = false,
    int? minLines,
    int? maxLines,
  }) : super(
         valueAccessor: _FcmReactiveJsonValueAccessor(),
         builder: (field) {
           final state = field as _FcmReactiveJsonFieldState;

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
                 JsonTextField(
                   controller: state._controller,
                   key: textFieldKey,
                   autofocus: autofocus,
                   keyboardType: keyboardType,
                   textInputAction: textInputAction,
                   autocorrect: autocorrect,
                   obscureText: obscureText,
                   style: style,
                   minLines: minLines,
                   maxLines: maxLines,
                   expands: expands,
                   showErrorMessage: false,
                   textAlignVertical: TextAlignVertical.top,
                   readOnly: readOnly,
                   decoration: decoration.copyWith(errorText: field.errorText),
                   inputFormatters: inputFormatters,
                   textCapitalization: textCapitalization,
                   onChanged: (field.didChange),
                 ),
               ],
             ),
           );
         },
       );

  @override
  ReactiveFormFieldState<Map<String, String>, String> createState() =>
      _FcmReactiveJsonFieldState();
}

class _FcmReactiveJsonFieldState
    extends ReactiveFormFieldState<Map<String, String>, String> {
  late JsonTextFieldController _controller;

  @override
  void initState() {
    super.initState();

    _controller = JsonTextFieldController();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  void onControlValueChanged(dynamic value) {
    final effectiveValue = (value == null) ? '' : value.toString();
    _controller.value = _controller.value.copyWith(
      text: effectiveValue,
      selection: TextSelection.collapsed(offset: effectiveValue.length),
      composing: TextRange.empty,
    );

    super.onControlValueChanged(value);
  }
}

class _FcmReactiveJsonValueAccessor
    extends ControlValueAccessor<Map<String, String>, String> {
  @override
  String? modelToViewValue(Map<String, String>? modelValue) {
    try {
      return modelValue?.let((modelValue) => jsonEncode(modelValue));
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, String>? viewToModelValue(String? viewValue) {
    Map<String, String>? value;
    var errors = false;

    if (viewValue?.isNotEmpty == true) {
      try {
        value = Map.castFrom(jsonDecode(viewValue!));

        errors = false;
      } catch (_) {
        value = null;
        errors = true;
      }
    }

    control?.setErrors({if (errors) FcmReactiveJsonField.invalid: true});

    return value;
  }
}
