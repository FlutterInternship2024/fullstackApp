class Product {
  final String productId;
  final String productName;
  final String imageUrl;
  int itemCount;
  double rating;
  final int price;
  String desc;
  String unit;
  String category;

  Product(this.productId, this.productName, this.imageUrl, this.itemCount,
      this.price, this.rating, this.desc, this.unit, this.category);
}
