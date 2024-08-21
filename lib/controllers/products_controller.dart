import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopping_api_classes/models/product_model.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ProductsController extends GetxController {
  List<ProductModel> productModelList = [];
  List<ProductModel> cartModelList = [];
  List categoriesList = [];

  bool isLoading = false;
  getData() async {
    isLoading = true;
    update();
    http.Response response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));
    var data = jsonDecode(response.body);
    // parsing
    for (var item in data) {
      productModelList.add(ProductModel.fromJson(item));
    }
    log(productModelList.length.toString());
    // log(data.toString());
    isLoading = false;
    update();
  }

  getCategiores() async {
    http.Response response = await http
        .get(Uri.parse("https://fakestoreapi.com/products/categories"));
    categoriesList = jsonDecode(response.body);
    update();
  }

  getProductsByCategory(String category) async {
    isLoading = true;
    update();
    productModelList.clear();
    http.Response response = await http
        .get(Uri.parse("https://fakestoreapi.com/products/category/$category"));
    var data = jsonDecode(response.body);
    for (var item in data) {
      productModelList.add(ProductModel.fromJson(item));
    }
    isLoading = false;
    update();
  }
}
