import 'package:freezed_annotation/freezed_annotation.dart';

import 'expense_category.dart';

part 'expense.freezed.dart';

@freezed
abstract class Expense with _$Expense {
  const factory Expense({
    required int id,
    required String title,
    required double amount,
    required DateTime date,
    required ExpenseCategory category,
  }) = _Expense;
}
