import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');
  late String currentUserId;

  @override
  void initState() {
    super.initState();
    getCurrentUserId();
  }

  Future<void> getCurrentUserId() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        currentUserId = user.uid;
      });
    }
  }

  CollectionReference get userExpensesCollection =>
      usersCollection.doc(currentUserId).collection('expenses');

  Future<void> addExpense(Expense expense) async {
    await userExpensesCollection.add(expense.toMap());
  }

  Future<void> removeExpense(Expense expense) async {
    await userExpensesCollection.doc(expense.id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewExpense()),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(
              expensesStream: userExpensesCollection.snapshots().map(
                  (querySnapshot) =>
                      querySnapshot as QuerySnapshot<Map<String, dynamic>>)),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: userExpensesCollection
                  .orderBy('date', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final List<Expense> loadedExpenses =
                    snapshot.data!.docs.map((queryDocumentSnapshot) {
                  final data =
                      queryDocumentSnapshot.data() as Map<String, dynamic>;
                  return Expense.fromMap(data);
                }).toList();

                return ExpensesList(
                  expenses: loadedExpenses,
                  removeExpense: removeExpense,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
