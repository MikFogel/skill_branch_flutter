import 'package:flutter/material.dart';
import 'package:skill_branch_lesson_dart/screens/feed_screen.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Feed(),
    );
  }
}
