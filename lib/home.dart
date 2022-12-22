import 'package:flutter/material.dart';
import 'package:uas_frontend_gs2223_72200424/post_data.dart';
import 'package:uas_frontend_gs2223_72200424/comments_data.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  static const appTitle = 'DRAWER';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Text('Selamat Datang'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              // leading: const Icon(Icons.access_time_outlined),
              title: const Text('POSTS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const post_data()));
              },
            ),
            ListTile(
              title: const Text('COMMENTS'),
              onTap: () {
              Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => const comments_data()));
              },
              ),
            ListTile(
              title: const Text('PHOTOS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const comments_data()));
              },
            ),
            ListTile(
              title: const Text('USERS'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const comments_data()));
              },
            ),
          ],
        ),
      ),
    );
  }
}


