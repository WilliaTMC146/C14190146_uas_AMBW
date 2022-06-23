import 'dart:convert';

import 'package:http/http.dart' as http;

class Service {
  Future<List<cData>> getAllData() async {
    final response = await http.get(
        Uri.parse("https://6283762138279cef71d77f41.mockapi.io/api/v1/data2"));
    if (response.statusCode == 200) {
      //200 = success get
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => cData.fromJson(data)).toList();
    } else {
      throw Exception("Failed to Load");
    }
  }

  Future postData(
    String pnama,
    String pavatar,
    String palamat,
    String pemail,
    String ppekerjaan,
    String pquote,
  ) async {
    final response = await http.post(
        Uri.parse("https://6283762138279cef71d77f41.mockapi.io/api/v1/data2"),
        body: {
          "nama": pnama,
          "avatar": pavatar,
          "alamat": palamat,
          "email": pemail,
          "pekerjaan": ppekerjaan,
          "quote": pquote,
        });

    if (response.statusCode == 201) {
      //201 = success update
      return true;
    } else {
      throw Exception("Failed to Post");
    }
  }

  Future<cData> getSingleData(String id) async {
    final response = await http.get(Uri.parse(
        "https://6283762138279cef71d77f41.mockapi.io/api/v1/data2/$id"));

    if (response.statusCode == 200) {
      cData jsonResponse = cData.fromJson(jsonDecode(response.body));
      return jsonResponse;
    } else {
      throw Exception("Failed to Get Data");
    }
  }

  Future<bool> deleteData(String id) async {
    final response = await http.delete(Uri.parse(
        "https://6283762138279cef71d77f41.mockapi.io/api/v1/data2/$id"));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Failed to Delete");
    }
  }
}
