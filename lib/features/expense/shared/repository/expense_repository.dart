import 'package:drift/drift.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/failure.dart';
import '../../../../db/app_database.dart' as db;
import '../model/expense.dart';
import '../model/expense_category.dart';
import '../model/expense_draft.dart';

part 'expense_repository.g.dart';

class ExpenseRepository {
  ExpenseRepository(this._db);

  final db.AppDatabase _db;

  TaskEither<AppFailure, List<Expense>> getAll() {
    return TaskEither.tryCatch(() async {
      final rows = await (_db.select(
        _db.expenses,
      )..orderBy([(t) => OrderingTerm.desc(t.date)])).get();
      return rows.map(toModel).toList();
    }, (e, _) => AppFailure('Failed to load expenses: $e'));
  }

  Stream<List<Expense>> watchAll() {
    return (_db.select(_db.expenses)
          ..orderBy([(t) => OrderingTerm.desc(t.date)]))
        .watch()
        .map((rows) => rows.map(toModel).toList());
  }

  TaskEither<AppFailure, int> add(ExpenseDraft draft) {
    final ExpenseDraft(:title, :amount, :date, :category) = draft;
    return TaskEither.tryCatch(
      () => _db
          .into(_db.expenses)
          .insert(
            db.ExpensesCompanion.insert(
              title: title.trim(),
              amount: amount,
              date: date,
              category: Value(category.name),
            ),
          ),
      (e, _) => AppFailure('Failed to save expense: $e'),
    );
  }

  TaskEither<AppFailure, int> update(int id, ExpenseDraft draft) {
    final ExpenseDraft(:title, :amount, :date, :category) = draft;
    return TaskEither.tryCatch(
      () => (_db.update(_db.expenses)..where((t) => t.id.equals(id))).write(
        db.ExpensesCompanion(
          title: Value(title.trim()),
          amount: Value(amount),
          date: Value(date),
          category: Value(category.name),
        ),
      ),
      (e, _) => AppFailure('Failed to update expense: $e'),
    );
  }

  TaskEither<AppFailure, int> delete(int id) {
    return TaskEither.tryCatch(
      () => (_db.delete(_db.expenses)..where((t) => t.id.equals(id))).go(),
      (e, _) => AppFailure('Failed to delete expense: $e'),
    );
  }

  Expense toModel(db.Expense row) => Expense(
    id: row.id,
    title: row.title,
    amount: row.amount,
    date: row.date,
    category: ExpenseCategory.fromName(row.category),
  );
}

@Riverpod(keepAlive: true)
ExpenseRepository expenseRepository(Ref ref) {
  return ExpenseRepository(ref.watch(db.appDatabaseProvider));
}
