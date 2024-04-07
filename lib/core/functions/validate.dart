import 'package:get/get.dart';

validit(String value, int max, int min, String type) {
  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "not valid email";
    }
  }
  if (type == "phoneNumber") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "not valid phoneNumber";
    }
  }
  if (type == "password") {
    if (!GetUtils.isUsername(value)) {
      return "not valid password";
    }
    if (type == "username") {
      if (!GetUtils.isUsername(value)) {
        return "not valid username";
      }
    }
    if (value.length > max) {
      return "value can't be more than $max";
    }
    if (value.length < min) {
      return "value can't be less than $min";
    }
    if (value.isEmpty) {
      return "value can't be empty";
    }
  }
}
