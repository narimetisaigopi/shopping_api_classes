import 'package:flutter/material.dart';
import 'package:shopping_api_classes/models/galaxy_model.dart';

class GalaxyDetails extends StatefulWidget {
  final GalaxyModel galaxyModel;
  const GalaxyDetails({super.key,required this.galaxyModel});

  @override
  State<GalaxyDetails> createState() => _MyGalaxyDetailsState();
}

class _MyGalaxyDetailsState extends State<GalaxyDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:const Text("Galaxy Details"),
      ),
      body:Column(
        children: [
          Text(widget.galaxyModel.userId.toString()),
          Text(widget.galaxyModel.id.toString()),
          Text(widget.galaxyModel.title),
          Text(widget.galaxyModel.completed.toString()),
        ],
      ),
    );
  }
}