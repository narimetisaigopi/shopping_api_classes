import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CauroselScreen extends StatefulWidget {
  const CauroselScreen({super.key});

  @override
  State<CauroselScreen> createState() => _CauroselScreenState();
}

class _CauroselScreenState extends State<CauroselScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CauroselScreen"),
      ),
      body: Container(
        child: CarouselSlider(
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height,
                reverse: false,
                autoPlay: true,
                aspectRatio: 1.4,
                enlargeCenterPage: true,
                autoPlayInterval: Duration(seconds: 2)),
            items: [
              Image.network(
                  "https://i0.wp.com/cybersecureindia.in/wp-content/uploads/2022/06/Google-News-Feature-New1.jpg"),
              Image.network(
                  "https://seo-hacker.com/wp-content/uploads/2020/06/How-to-Get-in-Google-News_Cover-Photo.jpg"),
              Image.network(
                "https://i.pinimg.com/736x/81/1a/3a/811a3adf2df50bf48bfde97bcbb871c6.jpg",
                // fit: BoxFit.fill,
              ),
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  "https://i0.wp.com/cybersecureindia.in/wp-content/uploads/2022/06/Google-News-Feature-New1.jpg",
                ),
              )
            ]),
      ),
    );
  }
}
