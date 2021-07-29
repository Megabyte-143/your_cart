class Product {
  Product({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.brand,
    required this.productCategoryName,
    required this.price,
    required this.quantity,
    required this.isPopular,
  });

  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final String brand;
  final String productCategoryName;
  final double price;
  final int quantity;
  final bool isPopular;
}
