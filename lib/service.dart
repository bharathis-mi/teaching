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
