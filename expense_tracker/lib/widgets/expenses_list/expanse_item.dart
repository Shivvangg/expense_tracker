import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense.dart';
//import 'package:expense_tracker/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 16.0,
      ),
      child: Column(
        children: [
          Text(
            expense.title,
            style: const TextStyle(
                color: Color.fromARGB(255, 2, 11, 55), fontSize: 16),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text('\$${expense.amount.toStringAsFixed(2)}'),
              const Spacer(), // takes all the available space and distribute among children
              Row(
                children: [
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(width: 8),
                  Text(expense.formattedDate)
                ],
              ),
            ],
          )
        ],
      ),
    ));
  }
}
