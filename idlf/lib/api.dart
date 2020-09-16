import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:idlf/model/User.dart';

//flutter 处理HTTP请求的三种基本方案(非常完整)
//https://www.toutiao.com/i6787626378570236428/

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
//        return users;
        success(users);

      } else {
        print("Http NG");
      }

    } catch (exp) {
      print("Http Fail is $exp");
    }
  }

  void purchase() async {

    var url = "$domain/api/market/purchase";

    try {

      var map = {
        "token":"xxxxx",
        "products":[
          {
            "product_id":20
          },
          {
            "product_id":3
          }
        ]
      };

      var request = await HttpClient().postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(map)));
      var response = await request.close();

      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var angelMap = jsonDecode(json);
        print("購買結果$angelMap");

      } else {
        print("Http NG");
      }
    } catch (exp) {
      print("Http Fail is $exp");
    }
  }

  void login(String token) async {

    var url = "$domain/api/login";

    var client = new http.MultipartRequest("post", Uri.parse(url));
    client.fields["token"] = token;
    client.send().then((http.StreamedResponse response) {
      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).join().then((String string) {
//          print(string);
        });
      } else {
        print('error');
      }
    }).catchError((error) {
      print(error);
    });
  }
}