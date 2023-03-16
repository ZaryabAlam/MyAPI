// import 'package:api1/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:myapi/services/remote_service.dart';

import '../models/comments.dart';

class CommentScreen extends StatefulWidget {
  // const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  // List<Comments>? comments;

  List<Comments> comments;
  var isLoaded = false;
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    comments = await RemoteServiceComment().getComments();
    if (comments != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: comments?.length,
          itemBuilder: (context, index) {
            // ignore: avoid_unnecessary_containers
            return Container(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comments[index].name,
                            // Text(comments![index].name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),

                          // Text(comments![index].body,
                          Text(
                            comments[index].body,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.normal),
                          ),

                          // Text(comments![index].email,
                          Text(
                            comments[index].email,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w100),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
