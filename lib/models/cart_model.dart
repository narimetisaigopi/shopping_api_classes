class CartModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  String iconButton;

  CartModel({
    this.id = 1,
    this.title = "Mens Clothing",
    this.price = 600,
    this.description = "Casual and comfortable, often made from cotton or a cotton blend. Available in various fits (slim, regular, relaxed) and styles (crew neck, V-neck, polo)",
    this.category = "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    this.image = "tshirt.png",
    this.iconButton="add_shopping_cart",
  });
}