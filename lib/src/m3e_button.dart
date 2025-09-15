import 'package:flutter/material.dart';

/// Material 3 を前提に、少し“表現豊か”なスタイルをデフォルト適用したボタン。
class M3EButton extends StatelessWidget {
  const M3EButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.variant = ButtonVariant.filled,
  });

  final Widget label;
  final Widget? icon;
  final VoidCallback? onPressed;
  final ButtonVariant variant;

  @override
  Widget build(BuildContext context) {
    final style = _styleFor(context);

    final child = icon == null
        ? label
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [icon!, const SizedBox(width: 8), label],
          );

    switch (variant) {
      case ButtonVariant.filled:
        return FilledButton(onPressed: onPressed, style: style, child: child);
      case ButtonVariant.tonal:
        return FilledButton.tonal(
          onPressed: onPressed,
          style: style,
          child: child,
        );
      case ButtonVariant.outlined:
        return OutlinedButton(onPressed: onPressed, style: style, child: child);
      case ButtonVariant.text:
        return TextButton(onPressed: onPressed, style: style, child: child);
    }
  }

  ButtonStyle _styleFor(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ButtonStyle(
      // 丸み強め＆ゆとりのあるパディング
      shape: WidgetStateProperty.all(const StadiumBorder()),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
      // 触った時のふるまい
      overlayColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered)) {
          return scheme.primary.withOpacity(0.08);
        }
        if (states.contains(WidgetState.pressed)) {
          return scheme.primary.withOpacity(0.12);
        }
        return null;
      }),
      elevation: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) return 0;
        if (states.contains(WidgetState.pressed)) return 1;
        return 3;
      }),
      animationDuration: const Duration(milliseconds: 220),
    );
  }
}

enum ButtonVariant { filled, tonal, outlined, text }
