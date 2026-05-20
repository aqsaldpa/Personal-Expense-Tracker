import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../common/widgets/app_text_field.dart';
import '../../../../common/widgets/category_chips.dart';
import '../../../../utils/formatters.dart';
import '../model/expense.dart';
import '../model/expense_category.dart';
import '../model/expense_draft.dart';
import 'expense_validators.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({
    super.key,
    this.initial,
    required this.isSaving,
    required this.saveLabel,
    required this.onSave,
  });

  final Expense? initial;
  final bool isSaving;
  final String saveLabel;
  final Future<void> Function(ExpenseDraft draft) onSave;

  @override
  State<ExpenseForm> createState() => ExpenseFormState();
}

class ExpenseFormState extends State<ExpenseForm> with ExpenseValidators {
  late final titleCtrl =
      TextEditingController(text: widget.initial?.title ?? '');
  late final amountCtrl = TextEditingController(
    text: widget.initial != null ? widget.initial!.amount.toString() : '',
  );
  late DateTime date = widget.initial?.date ?? DateTime.now();
  late final dateCtrl = TextEditingController(text: formatDate(date));
  late ExpenseCategory category =
      widget.initial?.category ?? ExpenseCategory.other;
  String? titleError;
  String? amountError;

  @override
  void dispose() {
    titleCtrl.dispose();
    amountCtrl.dispose();
    dateCtrl.dispose();
    super.dispose();
  }

  Future<void> pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(now.year - 5),
      lastDate: DateTime(now.year + 1),
    );
    if (picked == null) return;
    setState(() {
      date = picked;
      dateCtrl.text = formatDate(picked);
    });
  }

  Future<void> submit() async {
    setState(() {
      titleError = checkTitle(titleCtrl.text);
      amountError = checkAmount(amountCtrl.text);
    });
    if (titleError != null || amountError != null) return;

    await widget.onSave(
      ExpenseDraft(
        title: titleCtrl.text.trim(),
        amount: parseAmount(amountCtrl.text)!,
        date: date,
        category: category,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppTextField(
            controller: titleCtrl,
            label: 'Title',
            hint: 'e.g. Groceries',
            maxLength: 100,
            textInputAction: TextInputAction.next,
            errorText: titleError,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppTextField(
            controller: amountCtrl,
            label: 'Amount',
            prefixText: 'RM ',
            keyboardType:
                const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
            ],
            textInputAction: TextInputAction.done,
            errorText: amountError,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: AppTextField(
            controller: dateCtrl,
            label: 'Date',
            readOnly: true,
            onTap: pickDate,
            suffixIcon: const Icon(Icons.calendar_today_outlined),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Category',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        const SizedBox(height: 8),
        CategoryChips(
          selected: category,
          onSelected: (c) => setState(() => category = c ?? category),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FilledButton(
            onPressed: widget.isSaving ? null : submit,
            child: widget.isSaving
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(widget.saveLabel),
          ),
        ),
      ],
    );
  }
}
