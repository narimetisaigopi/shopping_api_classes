import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  bool showLoader = false;

  doLogin() async {
    showLoader = true;
    update();
    http.Response response = await http
        .post(Uri.parse("https://jsonplaceholder.typicode.com/posts"), body: {
      "email": emailTextEditingController.text,
      "password": passwordTextEditingController.text
    });
    showLoader = false;
    update();
  }
}
