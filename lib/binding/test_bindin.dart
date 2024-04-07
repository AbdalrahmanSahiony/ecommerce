import 'package:get/get.dart';
import 'package:flutter_application_19/core/classes/curd.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Curd());
  }
}
