import 'dart:convert';

import 'package:window_app/global_variables.dart';
import 'package:window_app/models/subcategory.dart';
import 'package:http/http.dart' as http;

class SubcategoryController {
  Future<List<Subcategory>> getSubCategoriesByCategoryName(String categoryName) async {
    try {
        http.Response reponse = await http.get(Uri.parse("$uri/api/category/$categoryName/subcategories"),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8'
        },);
        if(reponse.statusCode==200) {
          final List<dynamic> data = jsonDecode(reponse.body);
          if(data.isNotEmpty) {
            return data.map((subcategory)=>Subcategory.fromJson(subcategory)).toList();
          }else {
            print("subcategories not found");
            return [];
          }

        } else if(reponse.statusCode == 404) {
          print("subcategories not found");
          return [];
        }
        else {
         print("failed to fetch subcategories");
         return [];
        }
    }catch(e) {
      print('error fetching categories $e');
      return [];
    }
  }
}