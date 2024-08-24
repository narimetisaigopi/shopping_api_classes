import 'package:get/get.dart';
import 'package:shopping_api_classes/models/post_model.dart';
import 'dart:convert';
import 'dart:developer';
//import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class PostControllers extends GetxController{
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



   createNewOnePost() async {
    http.Response response = await http.post(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/add"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"userId":40,"id": 50,"title": "Suneel kumar", "body":"Mobile App Developper"}));
    if (response.statusCode == 201) {
      log("response ${response.statusCode}");
      log("response ${response.body}");
    } else {
       //api failed;
    }
  }
}