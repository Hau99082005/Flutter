import 'dart:convert';
import 'package:http/http.dart' as http;
import '../global_variables.dart';
import '../models/category.dart';

class CategoryController {
//load the uploaded category
  Future<List<Category>> loadCategories () async {
    try {
      //send an http get request to load the categories
      http.Response reponse =  await http.get(Uri.parse('$uri/api/categories'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8'
        },
      );
      print(reponse.body);
      if(reponse.statusCode == 200) {
        final List<dynamic> data = jsonDecode(reponse.body);
        List<Category> categories = data.map((category) =>Category.fromJson(category)).toList();

        return categories;
      } else {
        throw Exception('failed to load categories');
      }
    } catch(e) {
      throw Exception('Error loading Categories: $e');
    }
  }
}