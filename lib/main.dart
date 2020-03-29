import 'package:flutter/material.dart';
import 'package:travel/constants.dart';
import 'package:travel/screens/homepage.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        primaryColor: kprimary,
        accentColor: kaccent,
        scaffoldBackgroundColor: kscaffoldBackground,
      ),
      home: HomePage(),
    ));
