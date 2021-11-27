import 'package:flutter/material.dart';
import 'package:manga/Component/component_slider_popular.dart';
import 'package:manga/Component/component_slider_recommended.dart';
import 'package:manga/Utils/colors.dart';

class PagesHome extends StatefulWidget {
  const PagesHome({Key? key}) : super(key: key);

  @override
  _PagesHomeState createState() => _PagesHomeState();
}

class _PagesHomeState extends State<PagesHome> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          title: Text(
            "MangaIndo",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.account_circle,
                color: Colors.grey,
              ),
            )
          ],
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 20,
              left: 15,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Popular",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Popular manga for you",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ]),
                const Text(
                  "See all",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                )
              ],
            ),
          ),
          const ComponentSliderRecommended(),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              bottom: 10,
              left: 15,
              right: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Recommended",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Recommended manga for you",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ]),
                const Text(
                  "See all",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                )
              ],
            ),
          ),
          const ComponentSliderPopular(),
          const SizedBox(
            height: 80,
          )
        ]))
      ],
    );
  }
}
