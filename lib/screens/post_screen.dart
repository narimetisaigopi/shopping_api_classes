import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_api_classes/controllers/post_controllers.dart';
import 'package:shopping_api_classes/models/post_model.dart';
class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
PostControllers postControllers=Get.put(PostControllers());
  @override
  void initState() {
  postControllers.getPost();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<PostControllers>(builder:(postControllers)

       {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:const Text("Post Screen"),
            backgroundColor: Colors.purple,
          ),
        
        body:postControllers.isLoading
        ? const Center(child: CircularProgressIndicator(),
        )
        : GridView.builder(
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1),
          itemCount:postControllers. postModelList.length,
          itemBuilder: (context,index){
          PostModel postModel=
           postControllers.postModelList[index];
          return InkWell(
            onTap: () {
              
            },
            child: Card(
              child: Column(
                children: [
                  Text(postModel.userId.toString()),
                  Text(postModel.id.toString()),
                  Text(postModel.title),
                  Text(postModel.body,maxLines: 4,)
              
                ],
              ),
            ),
          );
         
        })
        );
      } );
   
  
  }

}