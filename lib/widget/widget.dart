import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo1/models/photo_model.dart';
import 'package:demo1/pages/full_screen.dart';
import 'package:flutter/material.dart';

Widget wallpaper(List<PhotosModel> listPhotos, BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
        padding: const EdgeInsets.all(4),
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        children: listPhotos.map((PhotosModel photsModel) {
          return GridTile(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          FullScreen(imagepath: photsModel.src!.portrait!)));
            },
            child: Hero(
                tag: photsModel.src!.portrait!,
                child: Container(
                  child: CachedNetworkImage(
                    imageUrl: photsModel.src!.portrait!,
                    fit: BoxFit.cover,
                  ),
                )),
          ));
        }).toList()),
  );
}
