class Transaction {
  final String id;
  final String name;
  final String avatar;
  final DateTime date;
  final double amount;

  Transaction({
    required this.id,
    required this.name,
    required this.avatar,
    required this.date,
    required this.amount,
  });
}