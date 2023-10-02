import 'package:flutter/material.dart';
import 'package:money_manager_app/data/userInfo.dart';
import 'package:money_manager_app/utils/constants.dart';
import 'package:money_manager_app/widget/income_expense_card.dart';
import 'package:money_manager_app/widget/transaction_card.dart';

class HomeScreenTab extends StatelessWidget {
  const HomeScreenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: defaultSpacing * 2,
            ),
            ListTile(
              title: Text('Hey! ${userData.name}'),
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  child: Image.asset('assets/images/avatar.jpeg')),
              trailing: Image.asset('assets/icons/bell.png'),
            ),
            const SizedBox(
              height: defaultSpacing,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    '\$${userData.totalBalance}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: fontSizeHeading, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: defaultSpacing / 2,
                  ),
                  Text(
                    'Total Balance',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: fontSubHeading),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: defaultSpacing * 2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: IncomeExpenseCard(
                      expenseData: ExpenseData('Income', '\$${userData.inflow}',
                          Icons.arrow_upward_rounded)),
                ),
                const SizedBox(
                  width: defaultSpacing,
                ),
                Expanded(
                  child: IncomeExpenseCard(
                    expenseData: ExpenseData('Expense', '\$${userData.outflow}',
                        Icons.arrow_downward_rounded),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: defaultSpacing * 2,
            ),
            Text(
              'Recent Transaction',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: defaultSpacing * 2,
            ),
            const Text(
              'Today',
              style: TextStyle(color: fontSubHeading),
            ),
            ...userData.transactions.map(
                (transaction) => TransacionItemTile(transaction: transaction)),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Yesterday',
              style: TextStyle(color: fontSubHeading),
            ),
            ...transaction2.map(
                (transaction) => TransacionItemTile(transaction: transaction)),
          ],
        ),
      ),
    );
  }
}
