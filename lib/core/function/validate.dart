import 'package:get/get.dart';

validit(String value, int max, int min, String type) {
  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "not valid email";
    } else if (value.length > max) {
      return "value can't be more than $max";
    } else if (value.length < min) {
      return "value can't be less than $min";
    } else if (value.isEmpty) {
      return "value can't be empty";
    }
  }
  if (type == "phoneNumber") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "not valid phoneNumber";
    } else if (value.length > max) {
      return "value can't be more than $max";
    } else if (value.length < min) {
      return "value can't be less than $min";
    } else if (value.isEmpty) {
      return "value can't be empty";
    }
  }
  if (type == "password") {
    if (!GetUtils.isUsername(value)) {
      return "not valid password";
    }
  }

  if (type == "username") {
    if (!GetUtils.isUsername(value)) {
      return "not valid username";
    }
  }

  if (type == "number") {
    if (!GetUtils.isNum(value)) {
      return "not valid";
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
