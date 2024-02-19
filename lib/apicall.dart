import 'dart:convert';
import 'dart:core';
import 'package:apidemo/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCall extends StatefulWidget {
  const ApiCall({super.key});

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  List<Welcome> welcome = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: welcome.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 180,
                      color: Colors.yellow,
                      margin: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'User Id:${welcome[index].userId}',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text(
                            'Id:${welcome[index].id}',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text(
                            'Title:${welcome[index].title}',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          Text(
                            'Body:${welcome[index].body}',
                            maxLines: 1,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Future<List<Welcome>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        welcome.add(Welcome.fromJson(index));
      }
      return welcome;
    } else {
      return welcome;
    }
  }
}
