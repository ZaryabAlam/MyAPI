// import 'package:api1/services/remote_service.dart';
// import 'package:api1/views/commentScreen.dart';
// import 'package:api1/views/postScreen.dart';
// import 'package:api1/views/userScreen.dart';
import 'package:flutter/material.dart';
import 'package:myapi/services/remote_service.dart';
import 'package:myapi/views/photoScreen.dart';

import '../models/posts.dart';
import 'commentScreen.dart';
import 'postScreen.dart';
import 'userScreen.dart';

class Home extends StatefulWidget {
  // const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //  List<Post>? posts;

  List<Post> posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Api"),
            bottom: TabBar(
              tabs: [
                Tab(child: Text("Posts")),
                Tab(child: Text("Comments")),
                Tab(child: Text("Users")),
                Tab(child: Text("Photos")),
              ],
            ),
          ),
          body: TabBarView(children: [
            PostScreen(),
            CommentScreen(),
            UserScreen(),
            PhotoScreen()
          ])),
    );
  }
}
