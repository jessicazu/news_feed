import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

// abstract classは、メソッドを定義しているだけのクラス
@ChopperApi()
abstract class ApiService extends ChopperService {
  static const BASE_URL = "https://newsapi.org/v2";
  static const API_KEY = "4202e67b1485447e840e8bf7a91b24c0";

  // HTTPクライアント作成
  static ApiService create() {
    final client = ChopperClient(
      baseUrl: BASE_URL,
      services: [
        _$ApiService()
      ],
      converter: JsonConverter(),// リクエストをJSONに変換
    );
    return _$ApiService(client);
  }

  // ヘッドラインニュース取得
  @Get(path: "/top-headlines")
  Future<Response> getHeadLines({
    // パラメータ指定、指定されなかったときのデフォルト引数を入れている
    @Query("apiKey") String apiKey = ApiService.API_KEY,
    @Query("country") String country = "jp",
    @Query("pageSize") int pageSize = 10,
  });

  // キーワードからニュース取得
  @Get(path: "/top-headlines")
  Future<Response> getKeywordNews({
    @Query("apiKey") String apiKey = ApiService.API_KEY,
    @Query("country") String country = "jp",
    @Query("pageSize") int pageSize = 30,
    @Query("q") String keyword,
  });

  // カテゴリからニュース取得
  @Get(path: "/top-headlines")
  Future<Response> getCategoryNews({
    @Query("apiKey") String apiKey = ApiService.API_KEY,
    @Query("country") String country = "jp",
    @Query("pageSize") int pageSize = 30,
    @Query("category") String category,
  });



}