import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;

  const DefaultButton({
    super.key,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.onPressed,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return backgroundColor?.withOpacity(0.5);
            }
            return backgroundColor;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.disabled)) {
              return textColor?.withOpacity(0.5);
            }
            return textColor;
          }),
          padding: WidgetStateProperty.all(padding),
        ),
        onPressed: onPressed,
        child: Text(
          text ?? '',
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
