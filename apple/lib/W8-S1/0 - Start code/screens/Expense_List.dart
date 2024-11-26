import 'package:flutter/material.dart';
import 'package:apple/W8-S1/0 - Start code/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) =>
          Text(index.toString() + " - " + expenses[index].title),
    );
  }
}