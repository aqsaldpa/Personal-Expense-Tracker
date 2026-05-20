import 'package:intl/intl.dart';

final _money = NumberFormat.currency(symbol: 'RM ', decimalDigits: 2);
final _date = DateFormat('d MMM yyyy');
final _dateInput = DateFormat('yyyy-MM-dd');

String formatMoney(double amount) => _money.format(amount);

String formatDate(DateTime d) => _date.format(d);

String formatDateInput(DateTime d) => _dateInput.format(d);

double? parseAmount(String raw) {
  final cleaned = raw.trim().replaceAll(',', '.');
  final n = double.tryParse(cleaned);
  if (n == null || n <= 0) return null;
  return n;
}
