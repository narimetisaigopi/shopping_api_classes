import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopping_api_classes/models/post_model.dart';
import 'package:shopping_api_classes/models/product_model.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ProductsController extends GetxController {
  List<ProductModel> productModelList = [];
  List<ProductModel> cartModelList = [];
  List categoriesList = [];
  List<PostModel>postModelList=[];

bool isLoading = false;
 getPost() async{
 
    isLoading=true;
     update();
   http.Response response = 
   await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
var post=jsonDecode(response.body);

for(var item in post){
postModelList.add(PostModel.fromJson(item));
}
log(postModelList.length.toString());

  isLoading=false;
  update();

  }


  bool isLoadingOne = false;
  getData() async {
    isLoadingOne = true;
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
    isLoadingOne = false;
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
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (var item in data) {
        productModelList.add(ProductModel.fromJson(item));
      }
    }
    isLoading = false;
    update();
  }

  createNewPost() async {
    http.Response response = await http.post(
        Uri.parse("https://dummyjson.com/posts/add"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"title": "Sai gpo", "userId": 5}));
    if (response.statusCode == 201) {
      log("response ${response.statusCode}");
      log("response ${response.body}");
    } else {
      // api failed
    }
  }
  

  deletPost() async {
    http.Response response = await http.delete(
        Uri.parse("https://dummyjson.com/posts/add"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"title": "Sai gpo", "userId": 5}));
    if (response.statusCode == 201) {
      log("response ${response.statusCode}");
      log("response ${response.body}");
    } else {
      // api failed
    }
  }

  editPost() async {
    http.Response response = await http.patch(
        Uri.parse("https://dummyjson.com/posts/add"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"title": "Sai gpo", "userId": 5}));
    if (response.statusCode == 201) {
      log("response ${response.statusCode}");
      log("response ${response.body}");
    } else {
      // api failed
    }
  }
}
