import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/product/product_model.dart';

class ProductService {
  static Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('http://miniso.website/api/product'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
      print('data fetched');
    } else {
      throw Exception('Failed to load products');
    }
  }
}
