import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:window_app/global_variables.dart';
import 'package:window_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:window_app/services/manage_http_reponse.dart';
import 'package:window_app/views/screens/authentication_screens/login_screen.dart';
import 'package:window_app/views/screens/main_screen.dart';

class AuthController {
  Future<void> signUpUsers({
    required context,
    required String email,
    required String fullname,
    required String password,
  }) async {
     try {
     User user = User(id: '',
      fullname: fullname, 
      email: email,
      state: '',
      city: '', 
      locality: '', 
      password: password,
      token: '',
     );

    http.Response reponse = await http.post(Uri.parse('$uri/api/signup'), body: user.toJson(),//Covert the user Object to Json for the request body
    headers: <String, String> {
      //Set the Headers for the request
      "Content-Type":"application/json; charset=UTF-8",
      //specify the context type as Json
    });
    
    manageHttpResonse(reponse: reponse, context: context, onSuccess: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
      const LoginScreen()
      ));
      showSnackBar(context, 'Account has been Created for you');
    });
     } catch (e) {
       print("Error, $e");
     }
  }

  //signin users function
  Future<void> signInUsers({required context,
    required String email,
    required String password}) async{
      try {
       http.Response reponse = await http.post(Uri.parse("$uri/api/signin"), body: jsonEncode({
          'email': email, //include the email in the request body,
          'password': password, //include the password in the request body,
        },

        ),
        headers: <String, String>{
        'Content-Type':'application/json; charset=UTF-8',
        });
        //handle the reponse using the managehttpresponse
        manageHttpResonse(reponse: reponse, context: context, onSuccess: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const MainScreen()),
              (route) => false);
          showSnackBar(context, 'Logged Successfully!');
        });
      } catch(e) {
        print("Error: $e");
      }
  }
}
