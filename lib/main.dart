import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_19/binding/test_bindin.dart';
import 'package:flutter_application_19/core/localeization/locale_conroller.dart';
import 'package:flutter_application_19/core/localeization/my_transletions.dart';
import 'package:flutter_application_19/core/servecies/servecies.dart';
import 'package:flutter_application_19/routes.dart';

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
    LocalleController controller = Get.put(LocalleController());
    return GetMaterialApp(
      locale: controller.language,
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: controller.theme,
      getPages: routes,
      initialBinding: TestBinding(),
    );
  }
}
