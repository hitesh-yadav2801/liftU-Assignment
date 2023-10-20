import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liftu_tech_assignment/screens/categories_screen.dart';

import 'consts/colors.dart';
import 'consts/styles.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: darkFontGrey,
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent
        ),
        fontFamily: regular,
      ),
      home: const CategoryScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

