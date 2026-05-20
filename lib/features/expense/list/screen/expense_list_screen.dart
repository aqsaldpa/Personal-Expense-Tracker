import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../routing/router.dart';
import '../../../../common/widgets/category_chips.dart';
import '../../../../common/widgets/empty_view.dart';
import '../../../../common/widgets/error_view.dart';
import '../../../../common/widgets/loading_view.dart';
import '../../shared/model/expense_category.dart';
import '../vm/expense_list_vm.dart';
import '../widgets/expense_list_view.dart';
import '../widgets/search_bar_field.dart';
import '../widgets/total_card.dart';

class ExpenseListScreen extends ConsumerStatefulWidget {
  const ExpenseListScreen({super.key});

  @override
  ConsumerState<ExpenseListScreen> createState() => ExpenseListScreenState();
}

class ExpenseListScreenState extends ConsumerState<ExpenseListScreen> {
  final searchCtrl = TextEditingController();

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  void clearFilters() {
    searchCtrl.clear();
    ref.read(expenseFilterVmProvider.notifier).reset();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(expenseListVmProvider);
    final filter = ref.watch(expenseFilterVmProvider);
    final filterVm = ref.read(expenseFilterVmProvider.notifier);
    final hasItems = async.value?.isNotEmpty ?? false;
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Expenses')),
      floatingActionButton: hasItems
          ? FloatingActionButton(
              onPressed: () => context.push(Routes.add),
              backgroundColor: scheme.primary,
              foregroundColor: scheme.onPrimary,
              elevation: 4,
              child: const Icon(Icons.add),
            )
          : null,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: switch (async) {
          AsyncData(:final value) when value.isEmpty => EmptyView(
              key: const ValueKey('empty'),
              title: 'No expenses yet',
              message: 'Tap "Add expense" to start tracking.',
              icon: Icons.receipt_long_outlined,
              action: FilledButton.icon(
                onPressed: () => context.push(Routes.add),
                icon: const Icon(Icons.add),
                label: const Text('Add expense'),
              ),
            ),
          AsyncData() => DataLayout(
              key: const ValueKey('data'),
              searchCtrl: searchCtrl,
              onSearch: filterVm.search,
              selectedCategory: filter.category,
              onCategorySelected: filterVm.toggleCategory,
              onClearFilters: clearFilters,
            ),
          AsyncError() => ErrorView(
              key: const ValueKey('error'),
              message: "Couldn't load expenses. Pull down or try again.",
              onRetry: () => ref.invalidate(expenseListVmProvider),
            ),
          _ => const LoadingView(key: ValueKey('loading')),
        },
      ),
    );
  }
}

class DataLayout extends ConsumerWidget {
  const DataLayout({
    super.key,
    required this.searchCtrl,
    required this.onSearch,
    required this.selectedCategory,
    required this.onCategorySelected,
    required this.onClearFilters,
  });

  final TextEditingController searchCtrl;
  final ValueChanged<String> onSearch;
  final ExpenseCategory? selectedCategory;
  final ValueChanged<ExpenseCategory?> onCategorySelected;
  final VoidCallback onClearFilters;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(visibleExpensesProvider);
    final total = ref.watch(expenseTotalProvider);

    return Column(
      children: [
        TotalCard(total: total, count: items.length),
        SearchBarField(
          controller: searchCtrl,
          onChanged: onSearch,
        ),
        CategoryChips(
          selected: selectedCategory,
          onSelected: onCategorySelected,
          allowNone: true,
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ExpenseListView(
            items: items,
            onClearFilters: onClearFilters,
          ),
        ),
      ],
    );
  }
}
