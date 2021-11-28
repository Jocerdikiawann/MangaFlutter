import 'package:flutter/material.dart';
import 'package:manga/Component/component_slider_recommen.dart';
import 'package:manga/Component/component_slider_popular.dart';
import 'package:manga/Provider/manga_provider.dart';
import 'package:manga/Utils/colors.dart';
import 'package:provider/provider.dart';

class PagesHome extends StatefulWidget {
  const PagesHome({Key? key}) : super(key: key);

  @override
  _PagesHomeState createState() => _PagesHomeState();
}

class _PagesHomeState extends State<PagesHome> {
  @override
  void initState() {
    Provider.of<MangaProvider>(context, listen: false).getPopularManga();
    Provider.of<MangaProvider>(context, listen: false).getRecommendManga();
    super.initState();
  }

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
          Consumer<MangaProvider>(builder: (_, a, child) {
            return ComponentSliderPopular(
              popularModel: a.popularModel,
            );
          }),
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
          Consumer<MangaProvider>(builder: (_, a, child) {
            return ComponentSliderRecommended(
              recommendManga: a.recommendedManga,
            );
          }),
          const SizedBox(
            height: 80,
          )
        ]))
      ],
    );
  }
}
