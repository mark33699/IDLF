import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'package:idlf/model/User.dart';

//flutter 处理HTTP请求的三种基本方案(非常完整)
//https://www.toutiao.com/i6787626378570236428/

//1. body 有三种传输内容类型 Content-type：application/x-www-form-urlencoded、application/json、multipart/form-data
//2. io.dart 里的 HttpClient 实现的 HTTP 网络请求主要是实现基本的网络请求，还不支持POST请求的multipart/form-data传输。(x-www-form-urlencoded也搞不定啊....)

typedef UsersCallback = void Function(Users);

class APIManager {

  final domain = "https://reqres.in/api";

  void getUsers(UsersCallback success) async {
    var urlString = "$domain/users?per_page=100";

    try {
      var request = await HttpClient().getUrl(Uri.parse(urlString));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {

        var jsonString = await response.transform(utf8.decoder).join();
        var jsonMap = jsonDecode(jsonString);
        var users = Users.fromJson(jsonMap);
        success(users);

      } else {
        print("Http NG");
      }

    } catch (exp) {
      print("Http Fail is $exp");
    }
  }

  void loginHttpClientWWW(void Function() success, void Function() fail) async {

    var urlString = "https://reqres.in/api/login";
    HttpClient()
        .postUrl(Uri.parse(urlString))
        .then((HttpClientRequest request) {
      request.headers.contentType = ContentType("application", "x-www-form-urlencoded");
      request.write("email=eve.holt@reqres.in");
      request.write("password=cityslicka");
      return request.close();

    }).then((HttpClientResponse response) {
      if (response.statusCode == 200) {
        response.transform(utf8.decoder).join().then((String string) {
          print("HttpClient Success：$string");
          success();
        });
      } else {
        print("HttpClient Fail：${response.statusCode}");
        fail();
      }
    });
  }

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
        print("http Success：${response.body}");
        success();
      } else {
        print("http Fail：${response.statusCode}");
        fail();
      }
    }).catchError((error) {
      print("http Fail：${error.toString()}");
      fail();
    });
  }

  void loginDioWWW(void Function() success, void Function() fail) async {

    var urlString = "https://reqres.in/api/login";
    try {
      Response response = await Dio()
        .post(urlString,
          data: {"email":"eve.holt@reqres.in", "password":"cityslicka"},
          options: Options(contentType:Headers.formUrlEncodedContentType));
      print("Dio Success：${response.data}");
      success();
    } catch (error) {
      print("Dio Fail：${error.toString()}");
      fail();
    }
  }




}

class IOHttpUtils {

  HttpClient _httpClient = HttpClient();

  getHttpClient() async {
    _httpClient
        .get('https://api.github.com/', 80, '/users/zanderso')
        .then((HttpClientRequest request) {
          return request.close();
        })
        .then((HttpClientResponse response) {
      if (response.statusCode == 200) {
        response.transform(utf8.decoder).join().then((String string) {
          print(string);
        });
      } else {
        print("error");
      }
    });
  }

  getUrlHttpClient() async {
    var url = "https://api.github.com/users/zanderso";
    _httpClient
        .getUrl(Uri.parse(url))
        .then((HttpClientRequest request) {
      return request.close();
    }).then((HttpClientResponse response) {
      if (response.statusCode == 200) {
      response.transform(utf8.decoder).join().then((String string) {
        print(string);
      });
    } else {
      print("error");
    } });
  }

  postHttpClient() async {
    _httpClient
      .post('https://api.github.com/', 80, '/users/zanderso')
      .then((HttpClientRequest request) {
        request.headers.contentType = ContentType("application", "json");
        request.write("{\"name\":\"value1\",\"pwd\":\"value2\"}");
        return request.close();
      }).then((HttpClientResponse response) {
        if (response.statusCode == 200) {
          response.transform(utf8.decoder).join().then((String string) {
            print(string);
          });
        } else {
          print("error");
        }
      }
    );
  }

  postUrlHttpClient() async {
    var url = "https://api.github.com/users/zanderso";
    _httpClient
      .postUrl(Uri.parse(url))
      .then((HttpClientRequest request) {
        request.headers.contentType = ContentType("application", "x-www-form-urlencoded");
        request.write("page=2");
        return request.close();
    }).then((HttpClientResponse response) {
      if (response.statusCode == 200) {
      response.transform(utf8.decoder).join().then((String string) {
        print(string);
      });
    } else {
      print("error");
    } });
  }
}