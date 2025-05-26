import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_app/global_variables.dart';
import 'package:window_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:window_app/provider/user_provider.dart';
import 'package:window_app/services/manage_http_reponse.dart';
import 'package:window_app/views/screens/authentication_screens/login_screen.dart';
import 'package:window_app/views/screens/main_screen.dart';


final providerContainer = ProviderContainer();
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
    
    manageHttpResonse(reponse: reponse, context: context, onSuccess: () async{
      //Access sharedPreferences for token and user data storage
      SharedPreferences preferences = await SharedPreferences.getInstance();

      //Extract the authentication token from the response body
      String token = jsonDecode(reponse.body)['token'];

      //store the authentication toke securely in SharedPreferences
      await preferences.setString('auth_token', token);
      //Encode the user data recived from the backend as json
      final userJson = jsonEncode(jsonDecode(reponse.body)['user']);
      //update the application state with the user data using Riverpod
      providerContainer.read(userProvider.notifier).setUser(userJson);

      //store the data in sharePreference for future use
      await preferences.setString('user', userJson);

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
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> MainScreen()),
              (route) => false);
          showSnackBar(context, 'Logged Successfully!');
        });
      } catch(e) {
        print("Error: $e");
      }
  }
  //signout
   Future<void> signOutUser({required context}) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      //clear the token and user from SharedPreferen
      await preferences.remove('auth_token');
      await preferences.remove('user');
      //clear the user state
      providerContainer.read(userProvider.notifier).signOut();
      //navigate the user back to the login screen

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
            return const LoginScreen();
          }), (route) =>false);
      showSnackBar(context, 'SignOut successfully');
    }catch(e) {
      showSnackBar(context, "error Signing out");
    }
   }
}
