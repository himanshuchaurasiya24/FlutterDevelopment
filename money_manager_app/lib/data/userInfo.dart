enum TransactionType { outflow, inflow }

enum ItemCategoryType { fashion, grocery, payments }

class UserInfo {
  final String name;
  final String totalBalance;
  final String inflow;
  final String outflow;
  final List<Transaction> transactions;
  const UserInfo(
      {required this.name,
      required this.totalBalance,
      required this.inflow,
      required this.outflow,
      required this.transactions});
}

class Transaction {
  final ItemCategoryType categoryType;
  final TransactionType transactionType;
  final String itemCategoryName;
  final String itemName;
  final String amount;
  final String date;
  const Transaction(this.categoryType, this.transactionType,
      this.itemCategoryName, this.itemName, this.amount, this.date);
}

const List<Transaction> transaction1 = [
  Transaction(ItemCategoryType.fashion, TransactionType.outflow, 'Shoes',
      'Puma Sneakers', '3500.0', 'Aug 30'),
  Transaction(ItemCategoryType.fashion, TransactionType.outflow, 'Bag',
      'Gucci Flax', '10000.0', 'Aug 11')
];
const List<Transaction> transaction2 = [
  Transaction(ItemCategoryType.payments, TransactionType.inflow, 'Payments',
      'Transfer from AFCAO', '13000.0', 'July 30'),
  Transaction(ItemCategoryType.payments, TransactionType.inflow, 'Sales',
      'Fund Transfer', '1500.0', 'July 31'),
  Transaction(ItemCategoryType.payments, TransactionType.inflow, 'Rent',
      'Transfer from Eden', '10000.0', 'Jun 30'),
  Transaction(ItemCategoryType.grocery, TransactionType.outflow, 'Blazer',
      'Luiz Vuitton', '1500.0', 'Jun 9')
];
const userData = UserInfo(
    name: 'Himanshu',
    totalBalance: '4586.00',
    inflow: '4000.0',
    outflow: '2000.0',
    transactions: transaction1);
