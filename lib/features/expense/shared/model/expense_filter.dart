import 'package:freezed_annotation/freezed_annotation.dart';

import 'expense_category.dart';

part 'expense_filter.freezed.dart';

@freezed
abstract class ExpenseFilter with _$ExpenseFilter {
  const ExpenseFilter._();

  const factory ExpenseFilter({
    @Default('') String query,
    ExpenseCategory? category,
  }) = _ExpenseFilter;

  bool get isActive => query.isNotEmpty || category != null;

  static const empty = ExpenseFilter();
}
