import 'package:flutter/material.dart';
import 'package:shopping_api_classes/screens/caurosel_screen.dart';
import 'package:shopping_api_classes/screens/login.dart';
import 'package:shopping_api_classes/screens/post_screen.dart';
import 'package:shopping_api_classes/screens/responsive_products_screen.dart';

import 'screens/products_screen.dart';
import 'screens/razorpayment_gateway.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  RazorpaymentGateway()
    );
  }
}
