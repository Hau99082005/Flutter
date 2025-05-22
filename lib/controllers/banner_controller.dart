import 'dart:convert';
import 'package:http/http.dart' as http;

import '../global_variables.dart';
import '../models/banner_model.dart';

class BannerController {
  //fetch banners
  Future<List<BannerModel>> loadBanners () async {
    try {
      //send an http get request to fetch banners
      http.Response reponse = await http.get(Uri.parse('$uri/api/banner'),
        headers: <String, String>{
          "Content-Type": 'application/json; charset=UTF-8'
        },);
      print(reponse.body);
      if(reponse.statusCode==200) { //ok
        List<dynamic> data =  jsonDecode(reponse.body);


        List<BannerModel> banners = data.map((banner) => BannerModel.fromJson(banner)).toList();

        return banners;
      } else {
        ////throw an exception if the server response with an error status code
        throw Exception('Failed to load Banners');
      }
    }catch(e) {
      throw Exception('Error loading Banners $e');
    }
  }
}
