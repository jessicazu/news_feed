// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ApiService extends ApiService {
  _$ApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiService;

  @override
  Future<Response<dynamic>> getHeadLines(
      {String apiKey = ApiService.API_KEY,
      String country = "jp",
      int pageSize = 10}) {
    final $url = '/top-headlines';
    final $params = <String, dynamic>{
      'apiKey': apiKey,
      'country': country,
      'pageSize': pageSize
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getKeywordNews(
      {String apiKey = ApiService.API_KEY,
      String country = "jp",
      int pageSize = 30,
      String keyword}) {
    final $url = '/top-headlines';
    final $params = <String, dynamic>{
      'apiKey': apiKey,
      'country': country,
      'pageSize': pageSize,
      'q': keyword
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getCategoryNews(
      {String apiKey = ApiService.API_KEY,
      String country = "jp",
      int pageSize = 30,
      String category}) {
    final $url = '/top-headlines';
    final $params = <String, dynamic>{
      'apiKey': apiKey,
      'country': country,
      'pageSize': pageSize,
      'category': category
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
