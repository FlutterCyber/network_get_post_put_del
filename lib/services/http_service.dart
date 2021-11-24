import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:network_get_post_put_del/models/post_model.dart';

class Network {
  static String BASE = "dummy.restapiexample.com";
  // http APIs
  static String API_LIST = "/api/v1/employees";
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/"; //{id}
  static String API_DELETE = "/api/v1/delete/"; //{id}

  //http requests
// 1: GET request
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params); // http or https
    var response = await get(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // 2: POST request
  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api); // http or https
    var response = await post(uri, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  // 3: PUT request
  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api); // http or https
    var response = await put(uri, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  // 4: DEL request
  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params); // http or https
    var response = await delete(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  //http params
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      'name': post.name,
      'salary': post.salary.toString(),
      'age': post.age,
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Post post) {
    Map<String, String> params = new Map();
    params.addAll({
      'name': post.name,
      'salary': post.salary.toString(),
      'age': post.age,
      'id': post.id.toString(),
    });
    return params;
  }
}
