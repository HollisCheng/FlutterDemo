import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/retrofit_api.dart';

import 'retrofit_api.dart';

void main() => runApp(Nework());

class Nework extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Nework> {
  @override
  Widget build(BuildContext context) {
    return
        // MaterialApp(
        // title: 'Retrofit',
        // debugShowCheckedModeBanner: false,
        Scaffold(
            appBar: AppBar(
              // backgroundColor: Colors.blue[300],
              centerTitle: true,
              title: Text(
                'Flutter Retrofit',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: _buildBody(context));
    // );
  }

  FutureBuilder<List<Post>> _buildBody(BuildContext context) {
    final client =
        RestClient(Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<List<Post>>(
      future: client.getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Post> posts = snapshot.data;
          return _buildPosts(context, posts);
        } else {
          return Center(
            child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.black)),
          );
        }
      },
    );
  }

  ListView _buildPosts(BuildContext context, List<Post> posts) {
    print("post=${posts.toString()}");

    return ListView.builder(
      itemCount: posts.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(posts[index].picture),
            ),
            title: Text(
              posts[index].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(posts[index].email)
          ),
        );
      },
    );
  }
}
