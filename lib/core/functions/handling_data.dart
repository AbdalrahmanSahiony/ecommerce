import 'package:flutter_application_19/conection_state.dart';

handlingData(response) {
  if (response is ConectionState) {
    return response;
  } else {
    return ConectionState.succes;
  }
}
