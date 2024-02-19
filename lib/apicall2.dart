// import 'dart:convert';

// import 'package:apidemo/model2.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ApiCallTwo extends StatefulWidget {
//   const ApiCallTwo({super.key});

//   @override
//   State<ApiCallTwo> createState() => _ApiCallTwoState();
// }

// class _ApiCallTwoState extends State<ApiCallTwo> {
//   List<UserDetails>userDetails = [];
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
      
//     );
//   }
//   Future<List<UserDetails>> getData () async{
//     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//     var data = jsonDecode(response.body.toString());

//     if(response.statusCode ==200){
//       for(Map<String, dynamic> index in data){
//         userDetails.add(UserDetails.fromJson(index));
//       }
//       return userDetails;
      
      
//     }
//     else {
//       return userDetails;
//     }
//   }
 
// }