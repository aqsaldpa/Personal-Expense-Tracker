import 'package:flutter/material.dart';

import '../../../../utils/formatters.dart';

class TotalCard extends StatelessWidget {
  const TotalCard({
    super.key,
    required this.total,
    required this.count,
  });

  final double total;
  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final accent = Color.alphaBlend(
      Colors.black.withValues(alpha: 0.18),
      scheme.primary,
    );

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [scheme.primary, accent],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: scheme.primary.withValues(alpha: 0.12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(7),
                decoration: BoxDecoration(
                  color: scheme.onPrimary.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 16,
                  color: scheme.onPrimary,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'TOTAL',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: scheme.onPrimary.withValues(alpha: 0.85),
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            formatMoney(total),
            style: theme.textTheme.displaySmall?.copyWith(
              color: scheme.onPrimary,
              fontWeight: FontWeight.w700,
              letterSpacing: -1,
              height: 1.0,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.receipt_long_outlined,
                size: 14,
                color: scheme.onPrimary.withValues(alpha: 0.75),
              ),
              const SizedBox(width: 6),
              Text(
                count == 1 ? '1 expense' : '$count expenses',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: scheme.onPrimary.withValues(alpha: 0.85),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
