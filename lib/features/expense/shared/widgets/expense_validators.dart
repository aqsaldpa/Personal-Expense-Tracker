import '../../../../utils/formatters.dart';

mixin ExpenseValidators {
  String? checkTitle(String? v) {
    final value = v?.trim() ?? '';
    if (value.isEmpty) return 'Title is required';
    if (value.length > 100) return 'Title too long';
    return null;
  }

  String? checkAmount(String? v) {
    if (v == null || v.trim().isEmpty) return 'Amount is required';
    if (parseAmount(v) == null) return 'Enter a valid amount';
    return null;
  }
}
