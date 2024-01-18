class Reward {
  final String name;
  final int price;

  Reward({required this.name, required this.price});

  factory Reward.fromJson(Map<String, dynamic> json) {
    return Reward(
      name: json['name'] as String,
      price: json['price'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
    };
  }
}
