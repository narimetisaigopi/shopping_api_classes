import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shopping_api_classes/controllers/products_controller.dart';

import '../models/cart_model.dart';

class CartDetails extends StatelessWidget {
  final CartModel cartModel;

  const CartDetails({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(builder: (productsController) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Cart Details",style: TextStyle(color:Colors.red),),
           actions:[IconButton(onPressed: (){}, icon:const Icon(Icons.add_shopping_cart_outlined))],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          "Total items count ${productsController.productModelList.length}"),
                     
                       Image.network(
                      cartModel.image,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    
                    ]
                  ),
                    const SizedBox(width: 16),
                       Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        cartModel.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "\$${cartModel.price.toString()}",
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.green,
                        ),
                      ),
                    ),
                      Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(cartModel.description),
                    ),
                     IconButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>CartDetails(cartModel: cartModel)));
                     }, icon:const Icon(Icons.add_shopping_cart_outlined))
                     
                    
                  
                ],
              ),
            ],
          ),
        ),
      );
    }
    );
  }
}
