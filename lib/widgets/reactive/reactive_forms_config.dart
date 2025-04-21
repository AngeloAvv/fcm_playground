import 'package:fcm_playground/features/localization/extensions/build_context.dart';
import 'package:fcm_playground/widgets/reactive/fcm_reactive_json_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveFormsConfig extends SingleChildStatelessWidget {
  const ReactiveFormsConfig({super.key, super.child});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) =>
      ReactiveFormConfig(
        validationMessages: _validationMessages(context),
        child: child ?? const SizedBox(),
      );

  Map<String, ValidationMessageFunction> _validationMessages(
    BuildContext context,
  ) => {
    ValidationMessage.required:
        (_) => context.l10n?.validationRequired ?? 'validationRequired',
    FcmReactiveJsonField.invalid:
        (_) => context.l10n?.validationInvalidJson ?? 'validationInvalidJson',
  };
}
