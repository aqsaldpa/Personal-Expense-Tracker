import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../routing/router.dart';
import '../../../../common/widgets/empty_view.dart';
import '../../../../common/widgets/flushbar.dart';
import '../../../../common/widgets/flushbar_type.dart';
import '../../shared/model/expense.dart';
import '../../shared/model/expense_draft.dart';
import '../../shared/model/expense_filter.dart';
import '../../shared/repository/expense_repository.dart';
import '../vm/expense_list_vm.dart';
import 'expense_tile.dart';

class ExpenseListView extends ConsumerWidget {
  const ExpenseListView({
    super.key,
    required this.items,
    required this.onClearFilters,
  });

  final List<Expense> items;
  final VoidCallback onClearFilters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(expenseFilterVmProvider);

    Future<void> refresh() async {
      ref.invalidate(expenseListVmProvider);
      await Future.wait([
        ref.read(expenseListVmProvider.future),
        Future<void>.delayed(const Duration(milliseconds: 600)),
      ]);
    }

    if (items.isEmpty) {
      return RefreshIndicator(
        onRefresh: refresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            const SizedBox(height: 80),
            EmptyView(
              title: 'No matches',
              message: emptyMessage(filter),
              icon: Icons.search_off_outlined,
              action: TextButton.icon(
                onPressed: onClearFilters,
                icon: const Icon(Icons.filter_alt_off_outlined),
                label: const Text('Clear filters'),
              ),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: refresh,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 96),
        itemCount: items.length,
        separatorBuilder: (_, _) => const Divider(height: 1, indent: 72),
        itemBuilder: (_, i) {
          final item = items[i];
          return ExpenseTile(
            expense: item,
            onTap: () => openEditor(context, ref, item),
          );
        },
      ),
    );
  }

  String emptyMessage(ExpenseFilter filter) {
    final query = filter.query.trim();
    final cat = filter.category;
    if (query.isNotEmpty && cat != null) {
      return 'No results for "$query" in ${cat.label}';
    }
    if (query.isNotEmpty) return 'No results for "$query"';
    if (cat != null) return 'Nothing in ${cat.label} yet';
    return 'Try adjusting your filter';
  }

  Future<void> openEditor(
    BuildContext context,
    WidgetRef ref,
    Expense item,
  ) async {
    final deleted = await context.push<bool>(Routes.edit, extra: item);
    if (deleted != true || !context.mounted) return;

    final draft = ExpenseDraft(
      title: item.title,
      amount: item.amount,
      date: item.date,
      category: item.category,
    );
    Flushbar.show(
      context,
      message: 'Deleted "${item.title}"',
      type: FlushbarType.info,
      actionLabel: 'Undo',
      onAction: () => ref.read(expenseRepositoryProvider).add(draft).run(),
    );
  }
}
