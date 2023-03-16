// import 'package:api1/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:myapi/services/remote_service.dart';

import '../models/users.dart';

class UserScreen extends StatefulWidget {
  // const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
//  List<Users>? users;

  List<Users> users;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    users = await RemoteServiceUser().getUsers();
    if (users != null) {
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
            itemCount: users?.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  // ignore: avoid_unnecessary_containers
                  Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[300]),
                      child: Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.blue[400],
                      )),
                  const SizedBox(height: 10),
                  Text(users[index].username,
                      style: const TextStyle(fontSize: 20)),

                  Text(users[index].name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),

                  Text(users[index].email,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w300)),

                  // Text(users![index].username, style: const TextStyle(fontSize: 20)),

                  // Text(users![index].name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

                  // Text(users![index].email, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
                ],
              );
            },
          )),
    );
  }
}
