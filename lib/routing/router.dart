import 'package:go_router/go_router.dart';

import '../features/expense/add/screen/add_expense_screen.dart';
import '../features/expense/edit/screen/edit_expense_screen.dart';
import '../features/expense/list/screen/expense_list_screen.dart';
import '../features/expense/shared/model/expense.dart';

class Routes {
  const Routes._();
  static const list = '/';
  static const add = '/add';
  static const edit = '/edit';
}

final router = GoRouter(
  initialLocation: Routes.list,
  routes: [
    GoRoute(
      path: Routes.list,
      builder: (_, _) => const ExpenseListScreen(),
    ),
    GoRoute(
      path: Routes.add,
      builder: (_, _) => const AddExpenseScreen(),
    ),
    GoRoute(
      path: Routes.edit,
      builder: (_, state) {
        final expense = state.extra! as Expense;
        return EditExpenseScreen(initial: expense);
      },
    ),
  ],
);
