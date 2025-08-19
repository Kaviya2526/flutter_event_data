import 'package:flutter/material.dart';

enum ElevatedButtonState {
  active,
  disable,
}

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.buttonState = ElevatedButtonState.disable,
    this.backgroundColor,
    this.labelColor,
    this.width,
    this.height,
    this.borderColor,
    this.disabledBackgroundColor,
    this.side,
    this.textStyle,
    this.padding,
    this.suffixIcon,
  });

  final ElevatedButtonState buttonState;
  final VoidCallback? onPressed;
  final String label;
  final Color? backgroundColor;
  final Color? labelColor;
  final double? width;
  final double? height;
  final Color? borderColor;
  final Color? disabledBackgroundColor;
  final BorderSide? side;
  final TextStyle? textStyle;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          disabledBackgroundColor: disabledBackgroundColor ??
              colorScheme.primary.withValues(alpha: 0.10),
          backgroundColor: backgroundColor ??
              (ElevatedButtonState.active == buttonState
                  ? colorScheme.primary
                  : colorScheme.primary.withValues(alpha: 0.10)),
          padding: padding ?? const EdgeInsets.symmetric(vertical: 11),
          side: side ??
              BorderSide(
                color: borderColor ?? Colors.transparent,
                width: 0.5,
              ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: (textStyle ?? theme.textTheme.bodyMedium)
                  ?.copyWith(color: labelColor ?? colorScheme.onPrimary),
            ),
            if (suffixIcon != null) suffixIcon!,
          ],
        ),
      ),
    );
  }
}
