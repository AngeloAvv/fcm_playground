import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FcmReactiveTextField<T> extends StatelessWidget {
  final Key? textFieldKey;
  final TextInputType? keyboardType;
  final String formControlName;
  final String? label;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final ReactiveFormFieldCallback<T>? onSubmitted;
  final InputDecoration decoration;
  final bool autocorrect;
  final bool obscureText;
  final bool showErrors;
  final Map<String, ValidationMessageFunction>? validationMessages;
  final bool readOnly;
  final ControlValueAccessor<T, String>? valueAccessor;
  final List<TextInputFormatter> inputFormatters;
  final TextCapitalization textCapitalization;
  final EdgeInsets padding;
  final bool autofocus;
  final int? minLines;
  final int? maxLines;

  const FcmReactiveTextField({
    super.key,
    this.textFieldKey,
    this.keyboardType,
    required this.formControlName,
    this.label,
    this.style,
    this.textInputAction,
    this.onSubmitted,
    this.decoration = const InputDecoration(),
    this.autocorrect = true,
    this.obscureText = false,
    this.showErrors = true,
    this.validationMessages,
    this.readOnly = false,
    this.valueAccessor,
    this.inputFormatters = const [],
    this.textCapitalization = TextCapitalization.none,
    this.padding = EdgeInsets.zero,
    this.autofocus = false,
    this.minLines,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) => Padding(
    padding: padding,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            label!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        ReactiveTextField<T>(
          key: textFieldKey,
          autofocus: autofocus,
          keyboardType: keyboardType,
          formControlName: formControlName,
          valueAccessor: valueAccessor,
          textInputAction: textInputAction,
          autocorrect: autocorrect,
          obscureText: obscureText,
          onSubmitted: onSubmitted,
          style: style,
          showErrors: !showErrors ? (_) => false : null,
          validationMessages: validationMessages != null
              ? {
            ...ReactiveFormConfig.of(context)?.validationMessages ??
                {},
            ...validationMessages!,
          }
              : null,
          minLines: minLines,
          maxLines: maxLines,
          readOnly: readOnly,
          decoration: decoration,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
        ),
      ],
    ),
  );
}
