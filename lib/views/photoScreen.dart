// import 'package:api1/models/photos.dart';
// import 'package:api1/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:myapi/models/photos.dart';
import 'package:myapi/services/remote_service.dart';

class PhotoScreen extends StatefulWidget {
  // const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  //  List<Photos>? photos;

  List<Photos> photos;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    photos = await RemoteServicePhoto().getPhotos();
    if (photos != null) {
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
      child: ListView.builder(itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Card(
                elevation: 15,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 20, top: 10, left: 10, right: 10),
                      child: Container(
                        height: 320,
                        // width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blueGrey,
                            image: DecorationImage(
                                image: NetworkImage(photos[index].url))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.thumb_up_alt_outlined),
                          Icon(Icons.thumb_down_alt_outlined),
                          Icon(Icons.comment),
                          Icon(Icons.share),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    ));
  }
}
