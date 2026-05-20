import 'package:freezed_annotation/freezed_annotation.dart';

import 'expense_category.dart';

part 'expense_draft.freezed.dart';

@freezed
abstract class ExpenseDraft with _$ExpenseDraft {
  const factory ExpenseDraft({
    required String title,
    required double amount,
    required DateTime date,
    @Default(ExpenseCategory.other) ExpenseCategory category,
  }) = _ExpenseDraft;
}
