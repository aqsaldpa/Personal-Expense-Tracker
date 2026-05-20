import 'dart:async';

import 'package:flutter/material.dart';

import 'flushbar_type.dart';

class Flushbar extends StatefulWidget {
  const Flushbar({
    super.key,
    required this.message,
    required this.type,
    required this.duration,
    required this.onClose,
    this.actionLabel,
    this.onAction,
  });

  final String message;
  final FlushbarType type;
  final Duration duration;
  final VoidCallback onClose;
  final String? actionLabel;
  final VoidCallback? onAction;

  static void show(
    BuildContext context, {
    required String message,
    FlushbarType type = FlushbarType.info,
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final overlay = Overlay.of(context, rootOverlay: true);
    late OverlayEntry entry;
    var closed = false;

    void close() {
      if (closed) return;
      closed = true;
      entry.remove();
    }

    entry = OverlayEntry(
      builder: (_) => Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Flushbar(
          message: message,
          type: type,
          duration: duration,
          actionLabel: actionLabel,
          onAction: onAction,
          onClose: close,
        ),
      ),
    );
    overlay.insert(entry);
  }

  @override
  State<Flushbar> createState() => FlushbarState();
}

class FlushbarState extends State<Flushbar>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 220),
  );
  Timer? autoDismiss;

  @override
  void initState() {
    super.initState();
    controller.forward();
    autoDismiss = Timer(widget.duration, dismiss);
  }

  Future<void> dismiss() async {
    autoDismiss?.cancel();
    if (!mounted) return;
    await controller.reverse();
    if (mounted) widget.onClose();
  }

  @override
  void dispose() {
    autoDismiss?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fg = widget.type.foreground(context);
    final bg = widget.type.background(context);
    final slide = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    return SlideTransition(
      position: slide,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
          child: Material(
            color: bg,
            borderRadius: BorderRadius.circular(12),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Icon(widget.type.icon, color: fg),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.message,
                      style: TextStyle(color: fg),
                    ),
                  ),
                  if (widget.actionLabel != null)
                    TextButton(
                      style: TextButton.styleFrom(foregroundColor: fg),
                      onPressed: () {
                        widget.onAction?.call();
                        dismiss();
                      },
                      child: Text(widget.actionLabel!),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
