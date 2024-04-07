import 'package:admin/connection_state.dart';

handlingData(response) {
  if (response is ConectionState) {
    return response;
  } else {
    return ConectionState.succes;
  }
}
