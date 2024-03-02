import 'dart:convert';

import 'package:teaching/product_model.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchProduct() async {
  try {
    var response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body); // json string -> json Map or List
      print(data);
      return List.from(data.map((e) => Product.fromMap(e)));
    }
  } catch (e) {
    print(e);
    return [];
  }

  return [];
}

Future<bool> login(String username, String password) async {
  try {
    var response = await http.post(
        Uri.parse("http://staging.challengexpress.in/api/v1/authenticate"),
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json-patch+json',
          'Authorization':
              'Basic ZnJVd3JVZ3V6b21sYnJBWDpmcmVGYXN3b3N0dXJ1U1RsVk9qaVl1dGl3cnVicmx5SQ=='
        },
        body: jsonEncode({"userName": username, "password": password}));

    if (response.statusCode == 200) {
      return true;
    }
  } catch (e) {
    return false;
  }
  return false;
}
