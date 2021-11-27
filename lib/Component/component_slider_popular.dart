import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:manga/Utils/colors.dart';
import 'package:manga/Utils/utility.dart';

class ComponentSliderPopular extends StatefulWidget {
  const ComponentSliderPopular({Key? key}) : super(key: key);

  @override
  _ComponentSliderPopularState createState() => _ComponentSliderPopularState();
}

class _ComponentSliderPopularState extends State<ComponentSliderPopular> {
  int current = 0;
  List<String> imgList = [
    'https://images.unsplash.com/photo-1572197491557-5b1a2c767c7b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1548983965-416c1920352e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    "https://cdn.dribbble.com/users/3445255/screenshots/14904757/media/6ab956817729b3769623f228729e3e0a.jpg?compress=1&resize=1200x900"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 6,
        padding: const EdgeInsets.only(left: 13),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: imgList.length,
            itemBuilder: (context, index) => Container(
                width: MediaQuery.of(context).size.width / 4,
                margin: const EdgeInsets.symmetric(horizontal: 2.0),
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    )),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        imgList[index],
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ))));
  }
}
