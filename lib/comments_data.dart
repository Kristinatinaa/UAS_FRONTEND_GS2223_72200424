import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class comments_data extends StatefulWidget {
  const comments_data({Key? key}) : super(key: key);

  @override
  State<comments_data> createState() => _comments_dataState();
}

class _comments_dataState extends State<comments_data> {
  List _get = [];

  @override
  void initState() {
    super.initState();
    _getDataComments();
  }
  Future _getDataComments() async {
    try {
      final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/comments'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _get = data;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: const Text('CommentsData'),
      ),
      body : RefreshIndicator(
        onRefresh: _getDataComments,
        child: ListView.builder(
            itemCount: _get.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.red, width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  title: Text(_get[index]['postId'].toString() + " - " + _get[index]['id'].toString()),
                  subtitle: Text(_get[index]['name'].toString()),
                ),
              );
            }
        ),
      ),
    );
  }
}