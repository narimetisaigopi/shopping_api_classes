import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel productModel;

  const ProductDetails({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Column(
        children: [
          Image.network(productModel.image),
          Text(productModel.title),
          Text(productModel.description),
        ],
      ),
    );
  }
}
