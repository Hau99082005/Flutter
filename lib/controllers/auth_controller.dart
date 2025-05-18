import 'package:window_app/global_variables.dart';
import 'package:window_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:window_app/services/manage_http_reponse.dart';

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
      password: password);

    http.Response reponse = await http.post(Uri.parse('$uri/api/signup'), body: user.toJson(),//Covert the user Object to Json for the request body 
    headers: <String, String> {
      //Set the Headers for the request
      "Content-Type":"application/json; charset=UTF-8",//specify the context type as Json
    });
    
    manageHttpResonse(reponse: reponse, context: context, onSuccess: () {
      showSnackBar(context, 'Account has been Created for you');
    });
     } catch (e) {
       
     }
  }
}
