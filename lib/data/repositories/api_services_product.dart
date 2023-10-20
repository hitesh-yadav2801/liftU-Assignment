import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';

Future<List<ProductModel>> getProducts() async {
  var baseUrl = 'https://api.escuelajs.co/api/v1';
  Uri url = Uri.parse('$baseUrl/products');

  try {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of ProductModel objects
      List<dynamic> jsonResponse = json.decode(response.body);
      List<ProductModel> products = jsonResponse.map((data) {
        return ProductModel.fromJson(data);
      }).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  } catch (e) {
    // Handle any exceptions that may occur during the HTTP request
    print('Error loading products: $e');
    throw Exception('Failed to load products');
  }
}
