// ignore_for_file: non_constant_identifier_names

class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;

  Transaction ({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });
}