class Item {
  final String id;
  final String name;
  final int quantity;
  final String unit;
  final double price;
  final String category;
  //final bool addCart;
  final String? observation;
  final String imageUrl;

  const Item({
    required this.id,
    required this.name,
    required this.quantity,
    required this.unit,
    required this.price,
    required this.category,
    // required this.addCart,
    this.observation,
    required this.imageUrl,
  });
}
