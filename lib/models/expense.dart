import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formated = DateFormat.yMd();

enum Category {food, travel, leisure, work}

const categoryIcon = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_class_rounded,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expense {
  Expense({
    required this.amount,
    required this.title,
    required this.date,
    required this.category,
  }) : id = uuid.v4();


  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formated.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses,});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category) 
  : expenses = allExpenses.where((expense) => expense.category == category).toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses)
    {
      sum += expense.amount;
    }
    return sum;
  }
}