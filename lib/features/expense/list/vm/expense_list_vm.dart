import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../shared/model/expense.dart';
import '../../shared/model/expense_category.dart';
import '../../shared/repository/expense_repository.dart';
import '../../shared/model/expense_filter.dart';

part 'expense_list_vm.g.dart';

@riverpod
class ExpenseListVm extends _$ExpenseListVm {
  @override
  Stream<List<Expense>> build() {
    return ref.watch(expenseRepositoryProvider).watchAll();
  }

  Future<void> delete(int id) =>
      ref.read(expenseRepositoryProvider).delete(id).run();
}

@riverpod
class ExpenseFilterVm extends _$ExpenseFilterVm {
  @override
  ExpenseFilter build() => ExpenseFilter.empty;

  void search(String q) => state = state.copyWith(query: q);

  void toggleCategory(ExpenseCategory? c) =>
      state = state.copyWith(category: c);

  void reset() => state = ExpenseFilter.empty;
}

@riverpod
List<Expense> visibleExpenses(Ref ref) {
  final all = ref.watch(expenseListVmProvider).value ?? const [];
  final ExpenseFilter(:query, :category) = ref.watch(expenseFilterVmProvider);
  final q = query.trim().toLowerCase();

  return all.where((e) {
    if (category != null && e.category != category) return false;
    if (q.isNotEmpty && !e.title.toLowerCase().contains(q)) return false;
    return true;
  }).toList();
}

@riverpod
double expenseTotal(Ref ref) {
  return ref
      .watch(visibleExpensesProvider)
      .fold<double>(0, (sum, e) => sum + e.amount);
}
