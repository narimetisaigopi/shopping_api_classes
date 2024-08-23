import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopping_api_classes/controllers/cart_controller.dart';
import 'package:shopping_api_classes/models/cart_model.dart';
import 'package:shopping_api_classes/controllers/products_controller.dart';
import 'package:shopping_api_classes/models/product_model.dart';
import 'package:shopping_api_classes/screens/cart_details.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartController) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cart Screen"),
          backgroundColor: Colors.purple,
        ),
        body: cartController.cartList.isEmpty
            ? const Center(child: Text("No Cart"))
            : ListView.builder(
                itemCount: cartController.cartList.length,
                itemBuilder: (context, index) {
                  // CartModel cartModel =
                  //            productsController.productModelList[index];
                  ProductModel cartModel = cartController.cartList[index];
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      child: Column(
                        children: [
                          Image.network(
                            cartModel.image,
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Text(cartModel.id.toString()),
                          Text(cartModel.title),
                          Text(cartModel.price.toString()),
                          TextButton(
                              onPressed: () {
                                cartController.removeFromCart(
                                    context, cartModel);
                              },
                              child: Text(
                                "Remove from cart",
                                style: TextStyle(color: Colors.red),
                              ))
                        ],
                      ),
                    ),
                  );
                }),
      );
    });
  }
}
