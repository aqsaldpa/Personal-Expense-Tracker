import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/failure.dart';
import '../../shared/model/expense_draft.dart';
import '../../shared/repository/expense_repository.dart';

part 'edit_expense_vm.g.dart';

@riverpod
class EditExpenseVm extends _$EditExpenseVm {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<bool> save({required int id, required ExpenseDraft draft}) async {
    state = const AsyncLoading();
    final result =
        await ref.read(expenseRepositoryProvider).update(id, draft).run();
    state = result.match(
      (AppFailure f) => AsyncError(f, StackTrace.current),
      (_) => const AsyncData(null),
    );
    return result.isRight();
  }

  Future<bool> delete(int id) async {
    state = const AsyncLoading();
    final result =
        await ref.read(expenseRepositoryProvider).delete(id).run();
    state = result.match(
      (AppFailure f) => AsyncError(f, StackTrace.current),
      (_) => const AsyncData(null),
    );
    return result.isRight();
  }
}
