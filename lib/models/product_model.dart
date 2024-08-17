class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;

  ProductModel({
    this.id = 0,
    this.title = "",
    this.price = 0,
    this.description = "",
    this.category = "",
    this.image = "",
  });

  factory ProductModel.fromJson(Map map) {
    return ProductModel(
        id: map["id"],
        title: map["title"],
        price: double.parse(map["price"].toString()),
        description: map["description"],
        category: map["category"],
        image: map["image"]);
  }
}
