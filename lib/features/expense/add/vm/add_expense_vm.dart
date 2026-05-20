import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/failure.dart';
import '../../shared/model/expense_draft.dart';
import '../../shared/repository/expense_repository.dart';

part 'add_expense_vm.g.dart';

@riverpod
class AddExpenseVm extends _$AddExpenseVm {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<bool> submit(ExpenseDraft draft) async {
    state = const AsyncLoading();
    final result =
        await ref.read(expenseRepositoryProvider).add(draft).run();
    state = result.match(
      (AppFailure f) => AsyncError(f, StackTrace.current),
      (_) => const AsyncData(null),
    );
    return result.isRight();
  }
}
