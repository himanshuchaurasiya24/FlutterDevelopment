import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widget/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {required this.expenses, super.key, required this.onRemoveExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
            background: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.error,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Stack(
                    children: [
                      Positioned(
                        top: 50,
                        left: 30,
                        child: Icon(
                          Icons.delete_forever_outlined,
                          size: 64,
                        ),
                      ),
                      Positioned(
                        top: 50,
                        right: 30,
                        child: Icon(
                          Icons.delete_forever_outlined,
                          size: 64,
                        ),
                      ),
                    ],
                  )),
            ),
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            key: ValueKey(
              expenses[index],
            ),
            child: ExpenseItem(expense: expenses[index])));
  }
}
