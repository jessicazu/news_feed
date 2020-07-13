import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/data/category_info.dart';
import 'package:news_feed/data/search_type.dart';
import 'package:news_feed/models/model/news_model.dart';
import 'package:news_feed/models/networking/api_service.dart';

class NewsRepository {

  // HTTPクライアント作成
  final ApiService _apiService = ApiService.create();

  // NewsAPIコール
 Future<List<Article>> getNews({@required SearchType searchType, String keyword, Category category}) async {
//    print("[Repository]searchType: ${searchType}, keyword: ${keyword}, category: ${category?.nameJp}");

    List<Article> result = List<Article>();
    Response response;

    try {
      switch (searchType) {
        case SearchType.HEAD_LINE:
          response = await _apiService.getHeadLines();
          break;
        case SearchType.KEYWORD:
          response = await _apiService.getKeywordNews(keyword: keyword);
          break;
        case SearchType.CATEGORY:
          response = await _apiService.getCategoryNews(category: category.nameEn); // パラメータは英語
          break;
      }
      
      if (response.isSuccessful) {
        // ステータスコード200~300
        final responseBody = response.body; // <- JSON
        result = News.fromJson(responseBody).articles;
      } else {
        // エラー
        final errorCode = response.statusCode;
        final error = response.error;
        print("response is not successful: $errorCode / $error");
      }
    } on Exception catch (e) {
      print("error: $e");
    }

    return result;
  }

  void dispose() {
   _apiService.dispose();
  }
}