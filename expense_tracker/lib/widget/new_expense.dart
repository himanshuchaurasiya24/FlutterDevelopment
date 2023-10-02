import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker/models/expense.dart' as category;

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // 1. Manual Approach for userInput
  // var _enteredTitle = '';
  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? selectedDate;
  category.Category _selectedCategory = category.Category.leisure;

  // void _presentDatePicker() {
  //   final now = DateTime.now();
  //   final firstDate = DateTime(now.year - 1, now.month, now.day);
  //   showDatePicker(
  //           context: context,
  //           initialDate: now,
  //           firstDate: firstDate,
  //           lastDate: now)
  //       .then((value) {
  //     //...

  //   });
  // }
  // another method is to use async and await
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          NewExpenseTextField(
            controller: _titleController,
            label: 'Title',
            maxLength: 50,
            inputType: TextInputType.emailAddress,
          ),
          Row(
            children: [
              Expanded(
                child: NewExpenseTextField(
                  label: 'Amount',
                  prefixText: '\$',
                  controller: _amountController,
                  inputType: const TextInputType.numberWithOptions(),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    selectedDate == null
                        ? 'No Date Selected'
                        : formatter.format(selectedDate!),
                  ),
                  IconButton(
                      onPressed: () {
                        _presentDatePicker();
                      },
                      icon: Icon(Icons.calendar_month_outlined))
                ],
              ))
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: category.Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    } else {
                      setState(() {
                        _selectedCategory = value;
                      });
                    }
                    print(value);
                  }),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    //
                  },
                  child: const Text('Save Expense'))
            ],
          )
        ],
      ),
    );
  }
}

class NewExpenseTextField extends StatelessWidget {
  const NewExpenseTextField({
    super.key,
    this.prefixText,
    this.maxLength,
    required this.label,
    required this.controller,
    required this.inputType,
  });

  final TextEditingController controller;
  final String label;
  final TextInputType inputType;
  final String? prefixText;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: inputType,
      controller: controller,
      maxLength: maxLength,
      decoration: InputDecoration(
        prefixText: prefixText,
        label: Text(label),
      ),
    );
  }
}
