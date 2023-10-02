import 'dart:math';

import 'package:flutter/material.dart';
import 'package:money_manager_app/data/userInfo.dart';
import 'package:money_manager_app/utils/constants.dart';

class TransacionItemTile extends StatelessWidget {
  final Transaction transaction;
  const TransacionItemTile({Key? key, required this.transaction})
      : super(key: key);
  String getSign(TransactionType type) {
    switch (type) {
      case TransactionType.inflow:
        return '+';
      case TransactionType.outflow:
        return '-';
    }
  }

  Color getRandomColor() {
    return Color(Random().nextInt(0xff000000));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultSpacing / 2),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          offset: Offset.zero,
          blurRadius: 10,
          spreadRadius: 4,
        )
      ], color: background, borderRadius: BorderRadius.circular(defaultRadius)),
      child: ListTile(
        leading: Container(
            padding: const EdgeInsets.all(defaultSpacing / 2),
            decoration: BoxDecoration(
                color: getRandomColor(),
                borderRadius: BorderRadius.circular(defaultRadius / 2)),
            child: transaction.categoryType == ItemCategoryType.fashion
                ? const Icon(Icons.supervised_user_circle_sharp)
                : const Icon(Icons.house)),
        title: Text(transaction.itemCategoryName,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: fontHeading,
                fontSize: fontSizeTitle,
                fontWeight: FontWeight.w700)),
        subtitle: Text(transaction.itemName,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: fontSubHeading,
                fontSize: fontSizeBody,
                fontWeight: FontWeight.w700)),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '${getSign(transaction.transactionType)} \$${transaction.amount}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color:
                        transaction.transactionType == TransactionType.outflow
                            ? Colors.red
                            : Colors.green,
                    fontSize: fontSizeBody,
                    fontWeight: FontWeight.w700)),
            Text(transaction.date,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: fontSubHeading,
                    fontSize: fontSizeBody,
                    fontWeight: FontWeight.w700))
          ],
        ),
      ),
    );
  }
}
