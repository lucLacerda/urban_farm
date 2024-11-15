class Item {
  Item({
    this.id,
    required this.name,
    required this.price,
  });

  int? id;
  String name;
  double price;

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        id: json['id'],
        name: json['name'],
        price: json['price'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'price': price,
      };
}
