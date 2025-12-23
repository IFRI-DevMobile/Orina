class Product {
  final String name;
  final int price;
  int quantity;

  Product({
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}