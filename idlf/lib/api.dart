

import 'dart:convert';
import 'dart:io';

import 'package:idlf/model/store.dart';

class APIManager {

  final domain = "https://app.angelsctek.com";

  void getStore() async {

    var url = "$domain/api/get_market_store?store_id=137";

    try {
      var request = await HttpClient().getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        var angelMap = jsonDecode(json);
        var angelAPI = AngelAPI.fromJson(angelMap);
        print("店號${angelAPI.result.number}");

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

  }
}