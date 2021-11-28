import 'package:flutter/material.dart';
import 'package:manga/Model/recommended_manga_model.dart';

class ComponentSliderRecommended extends StatefulWidget {
  final List<RecommendedMangaModel>? recommendManga;
  const ComponentSliderRecommended({Key? key, this.recommendManga})
      : super(key: key);

  @override
  _ComponentSliderRecommendedState createState() =>
      _ComponentSliderRecommendedState();
}

class _ComponentSliderRecommendedState
    extends State<ComponentSliderRecommended> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 6,
        padding: const EdgeInsets.only(left: 13),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: (widget.recommendManga!.isNotEmpty)
                ? widget.recommendManga!.length
                : 0,
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
                        (widget.recommendManga![index].thumb == null)
                            ? ""
                            : widget.recommendManga![index].thumb!,
                        fit: BoxFit.fill,
                      ),
                    ],
                  ),
                ))));
  }
}
