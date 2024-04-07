import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServecies extends GetxService {
  static late SharedPreferences sharedPreferences;
  Future<MyServecies> init() async {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAkM7HC8-KWEoJ-ihPtx7CzMwWlJRnMd6E",
            // from database sitting
            appId: "1:191773368304:android:a0ef0d9301840bcdba0735",
            //from database sitting
            messagingSenderId: "191773368304",
            //from database sitting
            projectId: "shop2-a7772"));
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServieces() async {
  await Get.putAsync(() => MyServecies().init());
}
