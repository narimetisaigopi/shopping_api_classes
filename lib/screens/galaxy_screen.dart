import 'dart:convert';
//import 'dart:math';
import 'dart:developer';  // Use 'dart:developer' for logging
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_api_classes/models/galaxy_model.dart';
import 'package:shopping_api_classes/screens/galaxy_details.dart';
class GalaxyScreen extends StatefulWidget {
  const GalaxyScreen({super.key});

  @override
  State<GalaxyScreen> createState() => _GalaxyScreenState();
}

class _GalaxyScreenState extends State<GalaxyScreen> {
  List<GalaxyModel>galaxyModelList=[];
   bool isLoading = true;  // Add a loading state
  getData()async{
 http.Response response =
 await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
 var data=jsonDecode(response.body);
 for(var item in data){
galaxyModelList.add(GalaxyModel.fromJson(item));
 }
 log(galaxyModelList.length.toString());
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
    return  Scaffold(
      appBar: AppBar(
       
        title:const Text("Galaxy Screen"),
        backgroundColor: Colors.red,
      ),
      
      // body:isLoading
      //   ?const  Center(child: CircularProgressIndicator())
      //  :ListView.builder(
      //   itemCount: galaxyModelList.length,
      //   itemBuilder: (context,index){
      //     GalaxyModel galaxyModel=galaxyModelList[index];
      //        return  Card(
      //          child: Column(
      //            children: [
      //              Text(galaxyModel.userId.toString()),
      //              Text(galaxyModel.id.toString()),
      //              Text(galaxyModel.title),
      //              Text(galaxyModel.completed.toString()),
      //            ],
      //          ),
      //        );
           
      // }),
      


   body:   isLoading
        ?const  Center(child: CircularProgressIndicator())
       :GridView.builder(
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,childAspectRatio:1),
        itemCount: galaxyModelList.length,
        itemBuilder: (context,index){
          GalaxyModel galaxyModel=galaxyModelList[index];
             return  InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (builder)=> GalaxyDetails(galaxyModel: galaxyModel,)));
              },
               child: Card(
                 child: Column(
                   children: [
                     Text(galaxyModel.userId.toString()),
                     Text(galaxyModel.id.toString()),
                     Text(galaxyModel.title),
                     Text(galaxyModel.completed.toString()),
                   ],
                 ),
               ),
             );
           
      }),
      
    );
  }
}