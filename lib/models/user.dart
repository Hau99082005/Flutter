import 'dart:convert';

class User {
  //Define Fields
  final String id;
  final String fullname;
  final String email;
  final String state;
  final String city;
  final String locality;
  final String password;

  User({required this.id, required this.fullname, required this.email, required this.state, required this.city, required this.locality, required this.password});


  //Serialization:Covert User object to a Map
  //Map: A Map is a Collection of key-value pairs
  //why:Coverting to a map is an intermerdia step that makes it easier to serialize
  //the object to formates like Json for storage or transmission.
  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      "id":id,
      'fullname':fullname,
      'email':email,
       'state':state,
       'city':city,
       'locality':locality,
       'password':password,
    };
  } 

  //Serialization: Covert Map to a Json String
  //This method directly encodes the data from the map into a Json String
  //The json.encode() function converts a Dart object(such as Map or List)
  //into a Json String reprensentation, making it suitable for communication 
  //between different systems.
  String toJson() => json.encode(toMap());

  //Deserialization:Covert a Map to a User Object
  //purpose - Manipulation and user: Once the data is Covert ato a User project
  //it can be easily manipuated and use within the application. For Example
  //we might want to display the user's fullname, email etc on the UI.or we might
  //want to save the data locally

  //the factory contructor takes a Map(usually obtained from a Json object)
  //and coverts it into a User obeject.if a field is not presend in the,
  //it defaults to an empty String.

  //fromMap: this contructor take a Map<String,dynamic> and coverts into a User Object
  //. its usefull when you already have the data in map format
  factory User.fromMap(Map<String, dynamic>map) {
    return User(id: map['_id'] as String? ?? "",
     fullname: map['fullname'] as String? ?? "", 
     email: map['email'] as String? ?? "",
     state: map['state'] as String? ?? "", 
    city: map['city'] as String? ?? "", 
    locality: map['locality'] as String? ?? "", 
    password: map['password'] as String? ?? "");
  }
  //fromJson: this factory contructor takes Json String, and decodes into a Map<String,dynamic>
  //and then uses fromMap to convert that Map into a User Object.
  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}