import 'dart:convert';

import 'package:demo1/models/photo_model.dart';
import 'package:demo1/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<PhotosModel> photos = [];
  TextEditingController searchcontroller = TextEditingController();
  bool search = false;

  getSearchWallpaper(String searchQuery) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$searchQuery&per_page=30"),
        headers: {
          "Authorization":
              "bAXdvf4f58NuhWCxmuOUo2OpBN0ZHKxzDsdOjL8HejhzI6IwvgBOZ72U"
        }).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      jsonData["photos"].forEach((element) {
        PhotosModel photosModel = PhotosModel();
        photosModel = PhotosModel.fromMap(element);
        photos.add(photosModel);
      });
      setState(() {
        search = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          const Center(
            child: Text(
              "Search Wallpaper",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins'),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: const Color(0xffececf8),
                borderRadius: BorderRadius.circular(10)),
            child: TextField(
              controller: searchcontroller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffix: GestureDetector(
                    onTap: () {
                      getSearchWallpaper(searchcontroller.text);
                    },
                    child: search
                        ? GestureDetector(
                            onTap: () {
                              photos = [];
                              search = false;
                              searchcontroller.clear();
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.close,
                              color: Color.fromARGB(255, 84, 87, 93),
                            ))
                        : const Icon(
                            Icons.search_outlined,
                            color: Color.fromARGB(255, 84, 87, 93),
                          ),
                  )),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(child: wallpaper(photos, context))
        ],
      ),
    );
  }
}
