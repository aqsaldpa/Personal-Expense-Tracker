import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/flushbar.dart';
import '../../../../common/widgets/flushbar_type.dart';
import '../../shared/widgets/expense_form.dart';
import '../vm/add_expense_vm.dart';

class AddExpenseScreen extends ConsumerWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(addExpenseVmProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Add expense')),
      body: SafeArea(
        child: ExpenseForm(
          isSaving: state.isLoading,
          saveLabel: 'Save',
          onSave: (draft) async {
            final ok =
                await ref.read(addExpenseVmProvider.notifier).submit(draft);
            if (!context.mounted) return;
            if (ok) {
              context.pop();
              return;
            }
            final err = ref.read(addExpenseVmProvider).error;
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
