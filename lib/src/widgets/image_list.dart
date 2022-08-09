// Copyright (c) 2022 Evolving Software Corporation
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/image_model.dart';

/// ## ImageList
/// ### This widget is a custom widget that displays a list of images.
class ImageList extends StatelessWidget {
  // Make all the fields immutable by adding 'final'.
  final List<PexelsModel> photos;
  ImageList(this.photos);

  // build listview widget.
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, int index) {
          // check if the photos list is empty.
          // if it is empty then display a message.
          // if it is not empty then sort the list and display the first image.
          if (photos.isEmpty) {
            return Container(
              child: const Center(
                child: Text('No Images Found'),
              ),
            );
          } else {
            var photoList = photos[index].photos;
            if (photoList!.isEmpty) {
              return Container(
                child: const Center(
                  child: Text('No Images Found'),
                ),
              );
            } else {
              var firstPhoto = photoList[0];
              return buildImage(firstPhoto);
            }
          }
        });
  }

  // build listview widget.
  Widget buildImage(Photos photo) {
    var firstPhotoUrl = photo.src?.landscape ?? 'fasdasd';
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
      ),
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      child: Center(
          child: Column(
        children:  <Widget>[
          Padding (
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Image.network(
              firstPhotoUrl,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            photo.photographer.toString(),
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      )),
    );
  }
}
