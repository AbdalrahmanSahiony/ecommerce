import 'package:delivery/core/const/colors.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  primaryColor: const Color.fromRGBO(255, 87, 34, 1),
  appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColor.primaryColor),
      titleTextStyle: const TextStyle(
          color: AppColor.primaryColor,
          fontSize: 35,
          fontFamily: "Cairo",
          fontWeight: FontWeight.bold),
      backgroundColor: Colors.grey[50]),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontFamily: "PlayfairDisplay",
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    bodyMedium: TextStyle(
      height: 2,
      color: AppColor.grey400,
      fontSize: 17,
    ),
    bodyLarge: TextStyle(
      height: 2,
      color: Colors.black,
      fontSize: 17,
    ),
  ),
  useMaterial3: true,
);
