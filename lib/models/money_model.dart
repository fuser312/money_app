class MoneyModel{
  final String? name;
  final bool isTopUp;
  final double amount;
  final String date;

  MoneyModel({required this.amount,  this.isTopUp = false, this.name = "Top Up", required this.date});
}