import 'package:admin/binding/test_binding.dart';
import 'package:admin/core/constant/theme.dart';
import 'package:admin/core/serviece.dart';
import 'package:admin/route.dart';
import 'package:admin/view/secreen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServieces();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: const Home(),
      debugShowCheckedModeBanner: false,
      theme: themeEnglish,
      initialBinding: TestBinding(),
      getPages: routes,
      initialRoute: "/",
    );
  }
}
