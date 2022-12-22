import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class post_data extends StatefulWidget {
  const post_data({Key? key}) : super(key: key);

  @override
  State<post_data> createState() => _post_dataState();
}

class _post_dataState extends State<post_data> {
  List _get = [];

  @override
  void initState() {
    super.initState();
    _getDataPost();
  }
  Future _getDataPost() async {
    try {
      final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts'));
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
        title: const Text('PostData'),
      ),
        body : RefreshIndicator(
          onRefresh: _getDataPost,
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
      title: Text(_get[index]['userId'].toString() + " - " + _get[index]['id'].toString()),
      subtitle: Text(_get[index]['title'].toString()),
    ),
    );
    }
    ),
    ),
    );
  }
}
