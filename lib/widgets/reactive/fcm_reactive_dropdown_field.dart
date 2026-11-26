import 'package:material_ui/material_ui.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FcmReactiveDropdownField<T> extends ReactiveFocusableFormField<T, T> {
  FcmReactiveDropdownField(
    List<DropdownMenuItem<T>> items, {
    required String formControlName,
    String? label,
    Key? textFieldKey,
    TextStyle? style,
    InputDecoration decoration = const InputDecoration(),
    bool showErrors = true,
    bool readOnly = false,
    EdgeInsets padding = EdgeInsets.zero,
    bool autofocus = false,
    super.validationMessages,
    super.key,
  }) : super(
         formControlName: formControlName,
         showErrors: !showErrors ? (_) => false : null,
         builder: (field) {
           final effectiveDecoration = decoration.applyDefaults(
             Theme.of(field.context).inputDecorationTheme,
           );
           final isDisabled = readOnly || field.control.disabled;
           final selected = field.value;
           final effectiveValue =
               items.any((item) => item.value == selected) ? selected : null;

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
                 DropdownButtonFormField<T>(
                   key: textFieldKey,
                   initialValue: effectiveValue,
                   items: items,
                   decoration: effectiveDecoration.copyWith(
                     errorText: field.errorText,
                     enabled: !isDisabled,
                   ),
                   style: style,
                   focusNode: field.focusNode,
                   autofocus: autofocus,
                   onChanged: isDisabled ? null : field.didChange,
                 ),
               ],
             ),
           );
         },
       );
}
