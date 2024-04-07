import 'package:delivery/binding/test_binding.dart';
import 'package:delivery/core/const/theme.dart';
import 'package:delivery/core/serviece.dart';
import 'package:delivery/route.dart';
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
      getPages: routes,
      debugShowCheckedModeBanner: false,
      theme: themeEnglish,
      initialBinding: TestBinding(),
    );
  }
}
