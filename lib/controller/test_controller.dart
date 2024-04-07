import 'package:get/get.dart';
import 'package:flutter_application_19/conection_state.dart';
import 'package:flutter_application_19/core/functions/handling_data.dart';
import 'package:flutter_application_19/data/data_source/remote/test_data.dart';

class TestController extends GetxController {
  List data = [];
  late ConectionState stateRequest;
  TestData testData = TestData(Get.find());
  Future getData() async {
    stateRequest = ConectionState.loading;
    var response = await testData.getData();
    stateRequest = handlingData(response);
    if (stateRequest == ConectionState.succes) {
      if (response["status"] == "succes") {
        data.addAll(response["data"]);
      } else {
        stateRequest = ConectionState.failure;
      }
    }

    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
