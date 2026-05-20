import 'package:flutter/material.dart';

import '../../features/expense/shared/model/expense_category.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({
    super.key,
    required this.selected,
    required this.onSelected,
    this.allowNone = false,
  });

  final ExpenseCategory? selected;
  final ValueChanged<ExpenseCategory?> onSelected;
  final bool allowNone;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          if (allowNone)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: const Text('All'),
                selected: selected == null,
                showCheckmark: false,
                onSelected: (_) => onSelected(null),
              ),
            ),
          for (final c in ExpenseCategory.values)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Text(c.label),
                selected: selected == c,
                showCheckmark: false,
                onSelected: (_) => onSelected(c),
              ),
            ),
        ],
      ),
    );
  }
}
