import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/confirm_sheet.dart';
import '../../../../common/widgets/flushbar.dart';
import '../../../../common/widgets/flushbar_type.dart';
import '../../../../utils/formatters.dart';
import '../../shared/model/expense.dart';
import '../../shared/widgets/expense_form.dart';
import '../vm/edit_expense_vm.dart';

class EditExpenseScreen extends ConsumerWidget {
  const EditExpenseScreen({super.key, required this.initial});

  final Expense initial;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editExpenseVmProvider);

    Future<void> confirmDelete() async {
      final ok = await ConfirmSheet.show(
        context,
        title: 'Delete expense?',
        message: '"${initial.title}" — ${formatMoney(initial.amount)}',
        confirmLabel: 'Delete',
        destructive: true,
      );
      if (!ok || !context.mounted) return;

      final deleted =
          await ref.read(editExpenseVmProvider.notifier).delete(initial.id);
      if (!context.mounted) return;

      if (deleted) {
        context.pop(true);
        return;
      }
      Flushbar.show(
        context,
        message: 'Failed to delete',
        type: FlushbarType.error,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit expense'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: 'Delete',
            onPressed: state.isLoading ? null : confirmDelete,
          ),
        ],
      ),
      body: SafeArea(
        child: ExpenseForm(
          initial: initial,
          isSaving: state.isLoading,
          saveLabel: 'Save changes',
          onSave: (draft) async {
            final ok = await ref
                .read(editExpenseVmProvider.notifier)
                .save(id: initial.id, draft: draft);
            if (!context.mounted) return;
            if (ok) {
              context.pop();
              return;
            }
            final err = ref.read(editExpenseVmProvider).error;
            Flushbar.show(
              context,
              message: 'Failed to save: $err',
              type: FlushbarType.error,
            );
          },
        ),
      ),
    );
  }
}
