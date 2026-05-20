import 'package:flutter/material.dart';

enum FlushbarType {
  success,
  error,
  info;

  IconData get icon => switch (this) {
        FlushbarType.success => Icons.check_circle_outline,
        FlushbarType.error => Icons.error_outline,
        FlushbarType.info => Icons.info_outline,
      };

  Color background(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return switch (this) {
      FlushbarType.success => const Color(0xFF2E7D32),
      FlushbarType.error => scheme.error,
      FlushbarType.info => scheme.inverseSurface,
    };
  }

  Color foreground(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return switch (this) {
      FlushbarType.success => Colors.white,
      FlushbarType.error => scheme.onError,
      FlushbarType.info => scheme.onInverseSurface,
    };
  }
}
