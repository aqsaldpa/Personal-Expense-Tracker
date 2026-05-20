import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_expense_tracker/utils/failure.dart';
import 'package:personal_expense_tracker/db/app_database.dart';
import 'package:personal_expense_tracker/features/expense/shared/model/expense_draft.dart';
import 'package:personal_expense_tracker/features/expense/shared/repository/expense_repository.dart';

void main() {
  late AppDatabase db;
  late ExpenseRepository repo;

  setUp(() {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    repo = ExpenseRepository(db);
  });

  tearDown(() async {
    await db.close();
  });

  ExpenseDraft draft({
    String title = 'Item',
    double amount = 10,
    DateTime? date,
  }) =>
      ExpenseDraft(
        title: title,
        amount: amount,
        date: date ?? DateTime(2026, 5, 20),
      );

  Future<int> add(ExpenseDraft d) async {
    final result = await repo.add(d).run();
    return result.match(
      (AppFailure f) => throw StateError(f.message),
      (value) => value,
    );
  }

  Future<List<dynamic>> getAll() async {
    final result = await repo.getAll().run();
    return result.match(
      (AppFailure f) => throw StateError(f.message),
      (value) => value,
    );
  }

  group('ExpenseRepository', () {
    test('starts empty', () async {
      expect(await getAll(), isEmpty);
    });

    test('add inserts and getAll returns the row', () async {
      final id = await add(draft(title: 'Groceries', amount: 25.5));
      expect(id, greaterThan(0));

      final all = await getAll();
      expect(all, hasLength(1));
      expect(all.first.title, 'Groceries');
      expect(all.first.amount, 25.5);
    });

    test('delete removes the row', () async {
      final id = await add(draft(title: 'Lunch'));
      await repo.delete(id).run();
      expect(await getAll(), isEmpty);
    });

    test('orders by date descending', () async {
      await add(draft(title: 'Old', date: DateTime(2026, 1, 1)));
      await add(draft(title: 'Recent', date: DateTime(2026, 5, 20)));

      final all = await getAll();
      expect(all.map((e) => e.title), ['Recent', 'Old']);
    });

    test('watchAll emits updates after add', () async {
      final stream = repo.watchAll();
      await add(draft(title: 'Coffee', amount: 4));

      final first = await stream.first;
      expect(first, hasLength(1));
      expect(first.first.title, 'Coffee');
    });

  });
}
