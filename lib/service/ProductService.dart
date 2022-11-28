import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:goodyear_waste_example/model/Product.dart';
import 'package:http/http.dart' as http;

Future<Products> fetchProducts() async {
  final uri = Uri.parse('http://127.0.0.1:8000/products');
  final headers = <String, String>{'Content-Type': 'application/json'};
  final response = await http.get(uri, headers: headers);
  if (kDebugMode) {
    print(jsonDecode(response.body));
  }
  final results = Products.fromJson(jsonDecode(response.body));
  return results;
}
