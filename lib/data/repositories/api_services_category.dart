import 'dart:convert';

import '../models/category_model.dart';
import 'package:http/http.dart' as http;

Future<List<Category>> getCategories() async {
  var baseUrl = 'https://api.escuelajs.co/api/v1';
  Uri url = Uri.parse('$baseUrl/categories');

  try {
    var response = await http.get(url);

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of Category objects
      List<dynamic> jsonResponse = json.decode(response.body);
      List<Category> categories = jsonResponse.map((data) {
        return Category.fromJson(data);
      }).toList();
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  } catch (e) {
    // Handle any exceptions that may occur during the HTTP request
    print('Error loading categories: $e');
    throw Exception('Failed to load categories');
  }
}
