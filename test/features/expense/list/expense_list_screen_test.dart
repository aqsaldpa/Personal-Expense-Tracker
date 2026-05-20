import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_expense_tracker/db/app_database.dart';
import 'package:personal_expense_tracker/features/expense/list/screen/expense_list_screen.dart';

Future<void> pumpScreen(WidgetTester tester, AppDatabase db) async {
  await tester.pumpWidget(
    ProviderScope(
      overrides: [appDatabaseProvider.overrideWithValue(db)],
      child: const MaterialApp(home: ExpenseListScreen()),
    ),
  );
  await tester.pumpAndSettle();
}

Future<void> unmount(WidgetTester tester) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('shows empty state when there are no expenses',
      (tester) async {
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);

    await pumpScreen(tester, db);

    expect(find.text('No expenses yet'), findsOneWidget);
    expect(find.text('Add expense'), findsOneWidget);

    await unmount(tester);
  });

  testWidgets('shows total and items when there is data', (tester) async {
    final db = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(db.close);

    await db.into(db.expenses).insert(
          ExpensesCompanion.insert(
            title: 'Coffee',
            amount: 5.5,
            date: DateTime(2026, 5, 20),
          ),
        );

    await pumpScreen(tester, db);

    expect(find.text('Coffee'), findsOneWidget);
    expect(find.text('TOTAL'), findsOneWidget);
    expect(find.text('1 expense'), findsOneWidget);
    expect(find.text('RM 5.50'), findsAtLeastNWidgets(1));

    await unmount(tester);
  });
}
