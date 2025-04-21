import 'package:flutter/material.dart' hide Route;

class SettingsIconButton extends StatelessWidget {
  final Color? color;
  final VoidCallback? onPressed;

  const SettingsIconButton({
    super.key,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.settings,
          color: color,
        ),
      );
}
