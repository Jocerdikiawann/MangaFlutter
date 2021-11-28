import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:manga/Model/manga_model.dart';
import 'package:manga/Model/popular_model.dart';
import 'package:manga/Model/recommended_manga_model.dart';
import 'package:manga/Utils/api_services.dart';

class MangaProvider with ChangeNotifier, DiagnosticableTreeMixin {
  List<MangaModel> _mangaModel = [];
  List<PopularModel> _popularModel = [];
  List<RecommendedMangaModel> _recommendedMangaModel = [];

  final ApiService _apiService = ApiService();

  List<MangaModel> get mangaModel => _mangaModel;
  void setMangaModel(List<MangaModel> val) {
    _mangaModel = val;
  }

  List<PopularModel> get popularModel => _popularModel;
  void setPopularModel(List<PopularModel> val) {
    _popularModel = val;
  }

  List<RecommendedMangaModel> get recommendedManga => _recommendedMangaModel;
  void setRecommendedManga(List<RecommendedMangaModel> val) {
    _recommendedMangaModel = val;
  }

  void getAllManga() async {
    try {
      var response = await _apiService.get('/manga/page/1');
      if (response["status"] == true) {
        List<dynamic> valueAllManga = response['manga_list'];
        List<MangaModel> value = [];
        if (valueAllManga.isNotEmpty) {
          for (var e in valueAllManga) {
            value.add(MangaModel(
              chapter: e["chapter"],
              endpoint: e["endpoint"],
              thumb: e["thumb"],
              title: e["title"],
              type: e["type"],
              updateOn: e["update_on"],
            ));
          }
          setMangaModel(value);
        }
      }
    } on DioError catch (e) {
      debugPrint(e.message.toString());
    }
  }

  void getPopularManga() async {
    try {
      var response = await _apiService.get('/manga/popular/1');
      if (response['status'] == true) {
        List<dynamic> valueAllManga = response['manga_list'];
        List<PopularModel> value = [];
        if (valueAllManga.isNotEmpty) {
          for (var data in valueAllManga) {
            value.add(PopularModel(
              chapter: data['chapter'],
              endpoint: data['endpoint'],
              thumb: data['thumb'],
              title: data['title'],
              type: data['type'],
              uploadOn: data['upload_on'],
            ));
          }
          setPopularModel(value);
        }
        debugPrint("data : ${value.toString()}");
      }
    } on DioError catch (e) {
      debugPrint(e.message.toString());
    }
  }

  void getRecommendManga() async {
    try {
      var response = await _apiService.get('/recommended');
      if (response['status'] == true) {
        if (response['manga_list'] != null) {
          List<dynamic> valueAllManga = response['manga_list'];
          List<RecommendedMangaModel> value = [];
          if (valueAllManga.isNotEmpty) {
            for (var data in valueAllManga) {
              value.add(RecommendedMangaModel(
                endpoint: data['endpoint'],
                thumb: data['thumb'],
                title: data['title'],
              ));
            }
            setRecommendedManga(value);
          }
          debugPrint("data rekomen : ${value.toString()}");
        }
      }
    } on DioError catch (e) {
      debugPrint(e.message.toString());
    }
  }
}
