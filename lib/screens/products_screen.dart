import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_api_classes/models/product_model.dart';

import 'product_details.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<ProductModel> productModelList = [];
  bool isLoading = false;
  getData() async {
    setState(() {
      isLoading = true;
    });
    http.Response response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    var data = jsonDecode(response.body);
    // parsing
    for (var item in data) {
      productModelList.add(ProductModel.fromJson(item));
    }
    log(productModelList.length.toString());
    // log(data.toString());
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products List"),
      ),
      // body: ListView.builder(
      //     itemCount: productModelList.length,
      //     itemBuilder: (context, index) {
      //       ProductModel productModel = productModelList[index];
      //       return InkWell(
      //         onTap: () {},
      //         child: Card(
      //           child: Column(
      //             children: [
      //               Image.network(productModel.image),
      //               Text(productModel.id.toString()),
      //               Text(productModel.title),
      //               Text(productModel.description),
      //               Text(productModel.price.toString()),
      //             ],
      //           ),
      //         ),
      //       );
      //     }),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1),
              itemCount: productModelList.length,
              itemBuilder: (context, index) {
                ProductModel productModel = productModelList[index];
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
                        // Text(productModel.id.toString()),
                        Text(
                          productModel.title,
                          maxLines: 1,
                        ),
                        Text("\$${productModel.price.toString()}"),
                      ],
                    ),
                  ),
                );
              }),
    );
  }
}
