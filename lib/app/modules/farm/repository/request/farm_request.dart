class Item {
  Item({
    this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory Item.empty() => Item.fromMap({});

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json['id'],
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        price: json['price'] ?? 0.0,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
      };

  int? id;
  String name;
  String description;
  double price;
}
