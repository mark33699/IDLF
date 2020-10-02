import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'package:idlf/model/User.dart';

typedef UsersCallback = void Function(Users);

class APIManager {

  final domain = "https://reqres.in/api";

  void getUsers(UsersCallback success) async {
    var urlString = "$domain/users?per_page=100";

    try {
      final httpClient = HttpClient();
      var request = await httpClient.getUrl(Uri.parse(urlString));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {

        var jsonString = await response.transform(utf8.decoder).join();
        var jsonMap = jsonDecode(jsonString);
        var users = Users.fromJson(jsonMap);
        success(users);

        httpClient.close();

      } else {
        print("Http NG");
      }

    } catch (exp) {
      print("Http Fail is $exp");
    }
  }

  //以下POST HttpClient分隔線=================

  void loginHttpClientWWW(void Function() success, void Function() fail) async {

    var urlString = "https://reqres.in/api/login";
    HttpClient()
        .postUrl(Uri.parse(urlString))
        .then((HttpClientRequest request) {
      request.headers.contentType = ContentType("application", "x-www-form-urlencoded");
      request.write("{\"email\":\"eve.holt@reqres.in\",\"password\":\"cityslicka\"}");
//      request.write("email=eve.holt@reqres.in");
//      request.write("password=cityslicka");
      return request.close();

    }).then((HttpClientResponse response) {
      if (response.statusCode == 200) {
        response.transform(utf8.decoder).join().then((String string) {
          print("HttpClientWWW Success：$string");
          success();
        });
      } else {
        print("HttpClientWWW Fail：${response.statusCode}");
        fail();
      }
    });
  }

  void loginHttpClientJson(void Function() success, void Function() fail) async {

    var urlString = "http://httpbin.org/delay/1";
    HttpClient()
        .postUrl(Uri.parse(urlString))
        .then((HttpClientRequest request) {
      request.headers.contentType = ContentType("application", "json");

      Map<String,String> p = {"UserName":"eve.holt@reqres.in", "Password":"cityslicka"};
      request.add(utf8.encode(json.encode(p)));
      return request.close();

    }).then((HttpClientResponse response) {
      if (response.statusCode == 200) {
        response.transform(utf8.decoder).join().then((String string) {
          print("HttpClientJson Success：$string");
          success();
        });
      } else {
        print("HttpClientJson Fail：${response.statusCode}");
        fail();
      }
    });
  }

  void loginHttpClientForm(void Function() success, void Function() fail) async {

  }

  //以下POST http分隔線=================

  void loginHttpWWW(void Function() success, void Function() fail) async {

    var urlString = "https://reqres.in/api/login";
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = "application/x-www-form-urlencoded";

    Map<String, String> bodyParams = new Map();
    bodyParams["email"] = "eve.holt@reqres.in";
    bodyParams["password"] = "cityslicka";
    http.Client()
        .post(urlString, headers: headersMap, body: bodyParams, encoding: Utf8Codec())
        .then((http.Response response) {
      if (response.statusCode == 200) {
        print("httpWWW Success：${response.body}");
        success();
      } else {
        print("httpWWW Fail：${response.statusCode}");
        fail();
      }
    }).catchError((error) {
      print("httpWWW Fail：${error.toString()}");
      fail();
    });
  }

  void loginHttpJson(void Function() success, void Function() fail) async {

    var urlString = "http://httpbin.org/delay/1";
    Map<String, String> headersMap = new Map();
    headersMap["content-type"] = ContentType.json.toString();

    Map<String, String> bodyParams = new Map();
    bodyParams["email"] = "eve.holt@reqres.in";
    bodyParams["password"] = "cityslicka";
    http.Client()
        .post(urlString, headers: headersMap, body: jsonEncode(bodyParams), encoding: Utf8Codec())
        .then((http.Response response) {
      if (response.statusCode == 200) {
        print("httpJson Success：${response.body}");
        success();
      } else {
        print("httpJson Fail：${response.statusCode}");
        fail();
      }
    }).catchError((error) {
      print("httpJson Fail：${error.toString()}");
      fail();
    });
  }

  void loginHttpForm(void Function() success, void Function() fail) async {

    var urlString = "https://postman-echo.com/post";
    var client = new http.MultipartRequest("post", Uri.parse(urlString));
    client.fields["email"] = "eve.holt@reqres.in";
    client.fields["password"] = "cityslicka";
    client.send().then((http.StreamedResponse response) {
      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).join().then((String string) {
          print("httpForm Success：$string");
          success();
        });
      } else {
        print("httpForm Fail：${response.statusCode}");
        fail();
      }
    }).catchError((error) {
      print("httpForm Fail：${error.toString()}");
      fail();
    });
  }

  //以下POST Dio分隔線=================

  void loginDioWWW(void Function() success, void Function() fail) async {

    var urlString = "https://reqres.in/api/login";
    try {
      Response response = await Dio()
        .post(urlString,
          data: {"email":"eve.holt@reqres.in", "password":"cityslicka"},
          options: Options(contentType:Headers.formUrlEncodedContentType));
      print("DioWWW Success：${response.data}");
      success();
    } catch (error) {
      print("DioWWW Fail：${error.toString()}");
      fail();
    }
  }

  void loginDioJson(void Function() success, void Function() fail) async {

    var urlString = "http://httpbin.org/delay/1";
    try {
      Response response = await Dio()
          .post(urlString,
          data: {"email":"eve.holt@reqres.in", "password":"cityslicka"},
          options: Options(contentType:Headers.jsonContentType));
      print("DioJson Success：${response.data}");
      success();
    } catch (error) {
      print("DioJson Fail：${error.toString()}");
      fail();
    }
  }

  void loginDioForm(void Function() success, void Function() fail) async {

    var urlString = "https://postman-echo.com/post";
    try {
      Response response = await Dio()
          .post(urlString,
          data: FormData.fromMap({"email":"eve.holt@reqres.in", "password":"cityslicka"}));
      print("DioForm Success：${response.data}");
      success();
    } catch (error) {
      print("DioForm Fail：${error.toString()}");
      fail();
    }
  }


}