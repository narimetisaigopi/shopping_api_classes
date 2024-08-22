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
   List<CartModel>cartModelList=[
      CartModel(
      id: 1,
      title: "T-Shirt",
      price: 20.0,
      description: "A comfortable cotton t-shirt.",
      category: "Men's Clothing",
      image: "https://e7.pngegg.com/pngimages/3/819/png-clipart-printed-t-shirt-polo-shirt-clothing-t-shirt-tshirt-fashion-thumbnail.png",
    ),
     CartModel(
      id: 2,
      title: "Jeans",
      price: 40.0,
      description: "Classic blue jeans.",
      category: "Men's Clothing",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUjODnGzA2s_fStXhLonJ32N5HZGQnVizaZw&s",
    ),
    CartModel(
      id: 2,
      title: "Jeans",
      price: 40.0,
      description: "Classic blue jeans.",
      category: "Men's Clothing",
      image: "https://w7.pngwing.com/pngs/407/12/png-transparent-jacket-helly-hansen-ski-suit-raincoat-men-s-jackets-thumbnail.png",
    ),
    CartModel(
      id: 2,
      title: "Jeans",
      price: 40.0,
      description: "Classic blue jeans.",
      category: "Men's Clothing",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoVwNuaBHOhID3ONHJaL5FtIqmN38Ue2k2PA&s",
    ),
    CartModel(
      id: 2,
      title: "Bag",
      price: 40.0,
      description: "Classic blue jeans.",
      category: "Men's Clothing",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeabKGd2eoRHwSftd2mVWFuyY7d0gH-Efclg&s",
    ),
    CartModel(
      id: 2,
      title: "Bag",
      price: 40.0,
      description: "Classic blue jeans.",
      category: "Men's Clothing",
      image: "https://www.shutterstock.com/image-illustration/realistic-empty-red-paper-shopping-260nw-1564118773.jpg",
    ),
   ];
     bool isLoading = true; 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text("Cart Screen"),
        backgroundColor: Colors.purple,
      ),
      body:cartModelList.isEmpty
          ? const Center(child: (CircularProgressIndicator()))
      
      : ListView.builder(
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
                   Image.network(cartModel.image,height: 100,width: double.infinity,fit: BoxFit.fill,),
                     Text(cartModel.id.toString()),
                     Text(cartModel.title),
                     Text(cartModel.price.toString()
                     ),
                     
                   ],
                 ),
               ),
                );
              }),
          );
        
    
    
  }
}