import 'package:flutter/material.dart';
import 'models/expense.dart';
import 'screens/Expense_item.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  // final List<Expense> _registeredExpenses = [
  //   Expense(
  //     title: 'Flutter Course',
  //     amount: 19.99,
  //     date: DateTime.now(),
  //     category: Category.work,
  //   ),
  //   Expense(
  //     title: 'Cinema',
  //     amount: 15.69,
  //     date: DateTime.now(),
  //     category: Category.leisure,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue[700],
          title: const Text('Ronan-The-Best Expenses App'),
          actions: const [
            IconButton(
              onPressed: null,
              icon: Icon(Icons.add),
              color: Colors.white,
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ExpenseItem(
              expense: Expense(
                title: 'Flutter Course',
                amount: 19.99,
                date: DateTime(2024, 11, 24),
                category: Category.work,
              ),
            ),
            ExpenseItem(
              expense: Expense(
                title: 'Cinema',
                amount: 15.69,
                date: DateTime(2024, 11, 24),
                category: Category.leisure,
              ),
            ),
          ],
        ));
  }
}