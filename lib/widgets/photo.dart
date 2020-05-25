import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skill_branch_lesson_dart/res/res.dart';

class Photo extends StatelessWidget {
  final String photoLink;

  Photo({this.photoLink});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(17)),
        child: Container(
          color: AppColors.grayChateau,
          child: CachedNetworkImage(imageUrl: photoLink),
        ),
      ),

    );
  }
}
