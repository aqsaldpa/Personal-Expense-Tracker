import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:personal_expense_tracker/utils/failure.dart';
import 'package:personal_expense_tracker/db/app_database.dart';
import 'package:personal_expense_tracker/features/expense/add/vm/add_expense_vm.dart';
import 'package:personal_expense_tracker/features/expense/shared/model/expense_draft.dart';
import 'package:personal_expense_tracker/features/expense/shared/repository/expense_repository.dart';

class ThrowingRepo extends ExpenseRepository {
  ThrowingRepo(super.db);

  @override
  TaskEither<AppFailure, int> add(ExpenseDraft draft) {
    return TaskEither.left(const AppFailure('boom'));
  }
}

ExpenseDraft sampleDraft() => ExpenseDraft(
      title: 'Coffee',
      amount: 5.5,
      date: DateTime(2026, 5, 20),
    );

void main() {
  group('AddExpenseVm.submit', () {
    test('returns true and inserts the draft on success', () async {
      final db = AppDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);

      final container = ProviderContainer(
        overrides: [appDatabaseProvider.overrideWithValue(db)],
      );
      addTearDown(container.dispose);

      final ok = await container
          .read(addExpenseVmProvider.notifier)
          .submit(sampleDraft());

      expect(ok, isTrue);
      expect(container.read(addExpenseVmProvider).hasError, isFalse);

      final saved =
          await container.read(expenseRepositoryProvider).getAll().run();
      expect(saved.isRight(), isTrue);
      expect(saved.getOrElse((_) => []), hasLength(1));
    });

    test('returns false and exposes error when repo fails', () async {
      final db = AppDatabase.forTesting(NativeDatabase.memory());
      addTearDown(db.close);

      final container = ProviderContainer(
        overrides: [
          expenseRepositoryProvider.overrideWithValue(ThrowingRepo(db)),
        ],
      );
      addTearDown(container.dispose);

      final ok = await container
          .read(addExpenseVmProvider.notifier)
          .submit(sampleDraft());

      expect(ok, isFalse);
      expect(container.read(addExpenseVmProvider).hasError, isTrue);
    });
  });
}
