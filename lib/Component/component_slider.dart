import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ComponentSlider extends StatefulWidget {
  const ComponentSlider({Key? key}) : super(key: key);

  @override
  _ComponentSliderState createState() => _ComponentSliderState();
}

class _ComponentSliderState extends State<ComponentSlider> {
  int current = 0;
  List<String> imgList = [
    'https://images.unsplash.com/photo-1572197491557-5b1a2c767c7b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1548983965-416c1920352e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 400.0),
      items: imgList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: const BoxDecoration(color: Colors.amber),
                child: Image.network(
                  i,
                  fit: BoxFit.fill,
                ));
          },
        );
      }).toList(),
    );
  }
}
