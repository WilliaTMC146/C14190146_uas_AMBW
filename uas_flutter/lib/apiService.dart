import 'dart:convert';

import 'package:uas_flutter/dataClass.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<List<News>> getAllData() async {
    final response = await http
        .get(Uri.parse("https://api-berita-indonesia.vercel.app/cnbc/terbaru"));
    if (response.statusCode == 200) {
      //200 = success get
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => News.fromJson(data)).toList();
    } else {
      throw Exception("Failed to Load");
    }
  }

  Future postData(String title, String pubDate, String description,
      String thumbnail, String link) async {
    final response = await http.post(
        Uri.parse("https://api-berita-indonesia.vercel.app/cnbc/terbaru"),
        body: {
          "title": title,
          "pubDate": pubDate,
          "description": description,
          "thumbnail": thumbnail,
          "link": link
        });

    if (response.statusCode == 201) {
      //201 = success update
      return true;
    } else {
      throw Exception("Failed to Post");
    }
  }

  Future<News> getSingleData(String id) async {
    final response = await http.get(Uri.parse(
        "https://6283762138279cef71d77f41.mockapi.io/api/v1/data2/$id"));

    if (response.statusCode == 200) {
      News jsonResponse = News.fromJson(jsonDecode(response.body));
      return jsonResponse;
    } else {
      throw Exception("Failed to Get Data");
    }
  }
}
