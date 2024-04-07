import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class SerchData {
  Curd curd = Curd();
  SerchData(this.curd);
  searchData(search) async {
    var response =
        await curd.postRequest(AppLink.searchItem, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
