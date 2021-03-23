import 'dart:convert';
import 'dart:io';

import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;

import 'package:rdsdms/constant/service.constant.dart';

class BaseService {
  static String baseApiUrl = ServiceConstant.baseUrl;
  static List<int> goodStatusCode = [
    HttpStatus.ok,
    HttpStatus.accepted,
    HttpStatus.created
  ];

  //-------- Get Path Of Api --------//
  static String path(List<String> paths) {
    if (paths == null) {
      return baseApiUrl;
    }

    final joinedPath = paths.join('/');
    final sanitizedPath =
        joinedPath.replaceAll(RegExp('^\/'), '').replaceAll(RegExp('\/+'), '/');
    final fullPath = '$baseApiUrl/$sanitizedPath';

    return fullPath;
  }

  //------- Get Header -------//
  static Future<Map> _getHeaders() async {
    http.Response response = await http
        .get(Uri.encodeFull(baseApiUrl + 'GetToken?u=Admin&p=Tps12341'));

    String token = response.body.replaceAll('"', '');

    Map<String, String> header = {
      'Content-Type': 'application/json; charset=utf-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer ' + token
    };

    return header;
  }

  //------- Http Get Method -------//
  static Future<TResult> get<TResult>(List<String> url) async {
    Map<String, String> header = await _getHeaders();

    final response = await http.get(path(url ?? []), headers: header);

    if (goodStatusCode.contains(response.statusCode)) {
      final responseBody = jsonDecode(response.body);

      return responseBody;
    }

    return null;
  }

  //------- Http Post Method -------//
  static Future<TResult> post<TBody, TResult>(
      List<String> url, TBody body) async {
    Map<String, String> header = await _getHeaders();
    final jsonBody = jsonEncode(body);

    final response = await http.post(
      path(url ?? []),
      body: jsonBody,
      headers: header,
    );

    if (goodStatusCode.contains(response.statusCode)) {
      final responseBody = jsonDecode(response.body);

      return responseBody;
    }

    return null;
  }

  //------- Http Delete Method -------//
  Future<TResult> delete<TResult>(List<String> url) async {
    Map<String, String> header = await _getHeaders();
    final response = await http.delete(path(url ?? []), headers: header);

    if (goodStatusCode.contains(response.statusCode)) {
      final responseBody = jsonDecode(response.body);

      return responseBody;
    }

    return null;
  }
}
