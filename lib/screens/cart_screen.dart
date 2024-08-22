import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shopping_api_classes/models/cart_model.dart';
import 'package:shopping_api_classes/controllers/products_controller.dart';
import 'package:shopping_api_classes/screens/cart_details.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
   List<CartModel>cartModelList=[];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text("Cart Screen"),
        backgroundColor: Colors.purple,
      ),
      body:Column(
        children: [
          SizedBox(
            height: 45,
            child: ListView.builder(
              itemCount: cartModelList.length,
              itemBuilder: (context,index){
                  // CartModel cartModel =
                  //            productsController.productModelList[index];
                 CartModel cartModel=cartModelList[index];
                return InkWell(
                 onTap: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CartDetails(cartModel: cartModel)));
                 },
                  child: Card(
                 child: Column(
                   children: [
                   Image.network(cartModel.image),
                     Text(cartModel.id.toString()),
                     Text(cartModel.title),
                     Text(cartModel.price.toString()),
                   ],
                 ),
               ),
                );
              }),
          )
        ],
      )
    );
  }
}