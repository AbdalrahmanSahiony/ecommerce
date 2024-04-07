import 'package:admin/core/classes/curd.dart';
import 'package:get/get.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Curd());
  }
}
