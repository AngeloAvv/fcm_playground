import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FcmReactiveDropdownField<T> extends StatelessWidget {
  final Key? textFieldKey;
  final String formControlName;
  final String? label;
  final TextStyle? style;
  final InputDecoration decoration;
  final bool showErrors;
  final Map<String, ValidationMessageFunction>? validationMessages;
  final bool readOnly;
  final EdgeInsets padding;
  final bool autofocus;
  final List<DropdownMenuItem<T>> items;

  const FcmReactiveDropdownField(this.items, {
    super.key,
    this.textFieldKey,
    required this.formControlName,
    this.label,
    this.style,
    this.decoration = const InputDecoration(),
    this.showErrors = true,
    this.validationMessages,
    this.readOnly = false,
    this.padding = EdgeInsets.zero,
    this.autofocus = false,
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
        ReactiveDropdownField<T>(
          items: items,
          key: textFieldKey,
          autofocus: autofocus,
          formControlName: formControlName,
          style: style,
          showErrors: !showErrors ? (_) => false : null,
          validationMessages: validationMessages != null
              ? {
            ...ReactiveFormConfig.of(context)?.validationMessages ??
                {},
            ...validationMessages!,
          }
              : null,
          readOnly: readOnly,
          decoration: decoration,
        ),
      ],
    ),
  );
}
