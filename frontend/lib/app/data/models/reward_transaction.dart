class RewardTransaction {
  final String name;
  final String date;

  RewardTransaction({required this.name, required this.date});

  factory RewardTransaction.fromJson(Map<String, dynamic> json) {
    return RewardTransaction(
      name: json['name'] as String,
      date: json['date'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
    };
  }
}
