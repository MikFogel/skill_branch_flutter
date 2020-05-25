import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:skill_branch_lesson_dart/res/res.dart';
import 'package:skill_branch_lesson_dart/screens/photo_screen.dart';
import 'package:skill_branch_lesson_dart/widgets/widgets.dart';


const String kFlutterDash =
    'https://flutter.dev/assets/404/dash_nest-c64796b59b65042a2b40fae5764c13b7477a592db79eaf04c86298dcb75b78ea.png';

class Feed extends StatefulWidget {
  Feed ({Key key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}


class _FeedState extends State<Feed> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: <Widget>[
                _buildItem(index),
                Divider(thickness: 1, color: AppColors.mercury)
              ],
            );
          }
      ),
    );
  }

  Widget _buildItem(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Photo(photoLink: kFlutterDash),
        ),
        _buildPhotoMeta(index),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical:  5),
          child: Text(
            'This is Flutter dash, I love him :)',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: AppStyles.h3.copyWith(color: AppColors.manatee),
          ),
        )
      ],
    );
  }

  Widget _buildPhotoMeta(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(

            children: <Widget>[
              UserAvatar('http://skill-branch.ru/img/speakers/Adechenko.jpg'),
              SizedBox(width: 6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Kirill Adeshcehno', style: AppStyles.h2Black),
                  Text('@kaparray', style: AppStyles.h5Black.copyWith(color: AppColors.manatee))
                ],
              ),
            ],
          ),
          LikeButton(likeCount: 10, isLiked: true),
        ],
      ),
    );

  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Photo'),
      leading: IconButton(
          icon: const Icon(CupertinoIcons.back),
          onPressed: () {
            Navigator.pop(context);
          }
      ),
    );
  }
}