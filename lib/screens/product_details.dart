import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopping_api_classes/controllers/products_controller.dart';

import '../models/product_model.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetails({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(builder: (productsController) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Product Details"),
        ),
        body: Column(
          children: [
            Text(
                "Total items count ${productsController.productModelList.length}"),
            Image.network(productModel.image),
            Text(productModel.title),
            Text(productModel.description),
          ],
        ),
      );
    }
    );
  }
}
