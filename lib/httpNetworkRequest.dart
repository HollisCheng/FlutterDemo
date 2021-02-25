import 'package:flutter/material.dart';
import 'package:flutter_app/models/posts.dart';
import 'package:flutter_app/repos/posts_repo.dart';

void main() => runApp(HttpNetwork());

class HttpNetwork extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HttpNetwork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: FutureBuilder<List<Post>>(
        future: PostsRepository().getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            showDialog(
              context: context,
              child: AlertDialog(
                title: Text("Error"),
                content: Text(snapshot.error.toString()),
              ),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(snapshot.data[index].title),
                subtitle: Text(
                  snapshot.data[index].body,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
