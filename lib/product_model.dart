class Product {
  int id;
  String title;
  num price;
  String description;
  String image;

  Product(
      {required this.id,
      required this.description,
      required this.price,
      required this.title,
      required this.image});

  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
        id: data["id"],
        description: data["description"],
        price: data["price"],
        title: data["title"],
        image: data["image"]);
  }
}
