import 'package:flutter/material.dart';

enum ExpenseCategory {
  food('Food', Icons.restaurant_menu_outlined),
  transport('Transport', Icons.directions_car_outlined),
  shopping('Shopping', Icons.shopping_bag_outlined),
  bills('Bills', Icons.receipt_outlined),
  other('Other', Icons.category_outlined);

  const ExpenseCategory(this.label, this.icon);

  final String label;
  final IconData icon;

  static ExpenseCategory fromName(String? name) {
    return ExpenseCategory.values.firstWhere(
      (c) => c.name == name,
      orElse: () => ExpenseCategory.other,
    );
  }
}
