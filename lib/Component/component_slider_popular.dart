import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:manga/Model/popular_model.dart';
import 'package:manga/Utils/colors.dart';
import 'package:manga/Utils/utility.dart';

class ComponentSliderPopular extends StatefulWidget {
  final List<PopularModel>? popularModel;
  const ComponentSliderPopular({Key? key, this.popularModel}) : super(key: key);

  @override
  _ComponentSliderPopularState createState() => _ComponentSliderPopularState();
}

class _ComponentSliderPopularState extends State<ComponentSliderPopular> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height / 2.5,
        autoPlay: true,
      ),
      items: widget.popularModel!.map((i) {
        debugPrint(i.title.runtimeType.toString());
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
                        (i.thumb != null) ? i.thumb! : "",
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        bottom: 0,
                        child: Image.asset(
                          "assets/bottom_gradient.png",
                          fit: BoxFit.fitWidth,
                          height: MediaQuery.of(context).size.height / 6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              i.title!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              (i.chapter != null) ? i.chapter! : "",
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 15),
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
