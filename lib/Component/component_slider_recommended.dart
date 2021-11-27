import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:manga/Utils/colors.dart';
import 'package:manga/Utils/utility.dart';

class ComponentSliderRecommended extends StatefulWidget {
  const ComponentSliderRecommended({Key? key}) : super(key: key);

  @override
  _ComponentSliderRecommendedState createState() =>
      _ComponentSliderRecommendedState();
}

class _ComponentSliderRecommendedState
    extends State<ComponentSliderRecommended> {
  int current = 0;
  List<String> imgList = [
    'https://images.unsplash.com/photo-1572197491557-5b1a2c767c7b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    'https://images.unsplash.com/photo-1548983965-416c1920352e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height / 2.5,
        autoPlay: true,
      ),
      items: imgList.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: const BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(radius),
                      bottomLeft: Radius.circular(radius),
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius),
                    )),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(radius),
                    bottomLeft: Radius.circular(radius),
                    topLeft: Radius.circular(radius),
                    topRight: Radius.circular(radius),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        i,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "My Hero Academia",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            const Text(
                              "Chapter 224",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text("Read now"),
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          primaryColor),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft:
                                            Radius.circular(radiusButton),
                                        bottomRight:
                                            Radius.circular(radiusButton),
                                        topLeft: Radius.circular(radiusButton),
                                        topRight: Radius.circular(radiusButton),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ));
          },
        );
      }).toList(),
    );
  }
}
