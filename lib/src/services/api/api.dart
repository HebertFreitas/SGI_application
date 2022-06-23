import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

enum RequestType { get, post }

class Api {
  final _baseURL = 'https://m.emive.com.br/sgiapi/api/';

  Future<http.Response?> request(
      String url, RequestType type, Object data) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    if (type == RequestType.get) {
      try {
        var urlRequest = Uri.parse(_baseURL + url);
        var response = await http.get(urlRequest, headers: {
          'content-type': 'application/json; charset=utf-8',
          'Authorization': 'Bearer $token',
        });
        return response;
      } catch (e) {
        print(e);
      }
    }
    if (type == RequestType.post) {
      try {
        var urlRequest = Uri.parse(_baseURL + url);
        var response = await http.post(urlRequest,
            body: const JsonEncoder().convert(data),
            headers: {
              'Content-Type': 'application/json',
            });
        return response;
      } catch (e) {
        print(e);
      }
    }
    return null;
  }
}
