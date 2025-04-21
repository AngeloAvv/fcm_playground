import 'package:flutter/material.dart' hide Route;

class DeleteIconButton extends StatelessWidget {
  final Color? color;
  final VoidCallback? onPressed;

  const DeleteIconButton({
    super.key,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.delete,
          color: color,
        ),
      );
}
