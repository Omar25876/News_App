import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/models/NewsResponse.dart';
import 'package:news/models/taps_response.dart';

class ApiManager{
static String baseUrl = 'https://newsapi.org';
static String apiKey = '4357911e85ed4ee6ac5b684e927e2dea';
static Future<TapsResponse> getTabs(String categoryId) async{

  var response  = await http.get(Uri.parse("$baseUrl/v2/top-headlines/sources?apiKey=$apiKey&category=$categoryId"));
  var json = jsonDecode(response.body);
  TapsResponse tabsResponse = TapsResponse.fromJson(json);
  return tabsResponse;
}

static Future<NewsResponse> getNews(String? TabId  ) async{

  var response  = await http.get(Uri.parse("$baseUrl/v2/everything?apiKey=$apiKey&sources=$TabId"));
  var json = jsonDecode(response.body);
  NewsResponse newsresponse = NewsResponse.fromJson(json);
  return newsresponse;
}



static Future<NewsResponse> getsearch(String? query) async{

  var response  = await http.get(Uri.parse("$baseUrl/v2/everything?apiKey=$apiKey&q=$query"));
  var json = jsonDecode(response.body);
  NewsResponse newsresponse = NewsResponse.fromJson(json);
  return newsresponse;
}


}