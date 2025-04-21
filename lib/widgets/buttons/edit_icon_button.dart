import 'package:flutter/material.dart' hide Route;

class EditIconButton extends StatelessWidget {
  final Color? color;
  final VoidCallback? onPressed;

  const EditIconButton({
    super.key,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.edit,
          color: color,
        ),
      );
}
