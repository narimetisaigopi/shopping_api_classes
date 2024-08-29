import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_api_classes/controllers/cart_controller.dart';
import 'package:shopping_api_classes/controllers/products_controller.dart';
import 'package:shopping_api_classes/models/product_model.dart';
import 'package:shopping_api_classes/screens/cart_screen.dart';
import 'package:shopping_api_classes/screens/products_screen.dart';

import 'product_details.dart';

class ResponsiveProductsScreen extends StatefulWidget {
  const ResponsiveProductsScreen({super.key});

  @override
  State<ResponsiveProductsScreen> createState() =>
      _ResponsiveProductsScreenState();
}

class _ResponsiveProductsScreenState extends State<ResponsiveProductsScreen> {
  ProductsController productsController = Get.put(ProductsController());

  CartController cartController = Get.put(CartController());

  @override
  void initState() {
    productsController.getData();
    //productsController.createNewOnePost();
    productsController.createNewPost();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("buildsize width ${size.width}");
    print("buildsize height ${size.height}");
    return GetBuilder<ProductsController>(builder: (productsController) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Products List"),
          actions: [
            GetBuilder<CartController>(builder: (cartController) {
              return Stack(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (builder) => const CartScreen()));
                             Navigator.of(context).push(MaterialPageRoute(
                            builder: (builder) => const ProductsScreen()));
                      },
                      icon: const Icon(Icons.add_shopping_cart_rounded)),
                  CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.amber,
                    child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(2),
                        child: Text("${cartController.cartList.length}")),
                  )
                ],
              );
            })
          ],
        ),
        body: Column(
          children: [
            const Text(
                """Flutter is a popular mobile app development framework that allows developers to build high-quality and dynamic apps for both iOS and Android platforms.
It offers a wide range of widgets that developers can use to create user interfaces, but sometimes it can be challenging to create a responsive UI that can adapt to different screen sizes. To solve this problem, Flutter provides the LayoutBuilder widget that helps developers to build responsive UIs.
In this article, we will discuss what is LayoutBuilder in Flutter, how it works, and how to use it to create responsive UIs."""),
            SizedBox(
              height: 45,
              child: ListView.builder(
                  itemCount: productsController.categoriesList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        productsController.getProductsByCategory(
                            productsController.categoriesList[index]);
                      },
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(productsController.categoriesList[index]),
                      )),
                    );
                  }),
            ),
            Expanded(
              child: productsController.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: size.width > 1368
                              ? 6
                              : size.width > 767 && size.width < 1368
                                  ? 4
                                  : 2,
                          childAspectRatio: size.width > 1368
                              ? 1.45
                              : size.width > 767 && size.width < 1368
                                  ? 1.0
                                  : 0.9),
                      itemCount: productsController.productModelList.length,
                      itemBuilder: (context, index) {
                        ProductModel productModel =
                            productsController.productModelList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => ProductDetails(
                                          productModel: productModel,
                                        )));
                          },
                          child: Card(
                            child: Column(
                              children: [
                                Image.network(
                                  productModel.image,
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                Text(
                                  productModel.title,
                                  maxLines: 1,
                                ),
                                Text(
                                  productModel.category,
                                  maxLines: 1,
                                ),
                                Text("\$${productModel.price.toString()}"),
                                IconButton(
                                    onPressed: () {
                                      cartController.addToCart(
                                          context, productModel);
                                    },
                                    icon: const Icon(
                                        Icons.add_shopping_cart_outlined))
                              ],
                            ),
                          ),
                        );
                      }),
            ),
          ],
        ),
      );
    });
  }
}
