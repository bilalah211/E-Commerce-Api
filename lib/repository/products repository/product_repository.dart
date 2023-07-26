import 'dart:convert';

import 'package:product_api/models/model.dart';
import 'package:http/http.dart' as http;
import 'package:product_api/resources/app%20urls/app_urls.dart';

class ProductRepository {
  Future<List<ProductModel>> productsApi() async {
    final response = await http
        .get(Uri.parse(AppUrls.productsUrl))
        .timeout(const Duration(seconds: 10));
    return productModelFromJson(response.body);
  }
}
