import 'package:expense_tracker/widget/expenses.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 182));
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          centerTitle: true,
          // elevation: 50,
          // foregroundColor: kColorScheme.primaryContainer,
          // backgroundColor: kColorScheme.onPrimaryContainer
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle().copyWith(
                  // fontWeight: FontWeight.normal,
                  // fontSize: 14,
                  ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
    ),
  );
}

// 120 finished and video 121 is on;
// video stopped at 01:52 nodata text added;