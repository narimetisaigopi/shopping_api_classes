import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopping_api_classes/models/product_model.dart';

class CartController extends GetxController {
  List<ProductModel> cartList = [];

  addToCart(BuildContext context, ProductModel productModel) {
    cartList.add(productModel);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Added to cart")));
    update();
  }

  removeFromCart(BuildContext context, ProductModel productModel) {
    cartList.removeWhere((e) => e.id == productModel.id);
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Added to cart")));
    update();
  }
}
