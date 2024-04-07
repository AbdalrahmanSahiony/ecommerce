import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class FavouriteViewData {
  Curd curd;
  FavouriteViewData(this.curd);
  viewFavourite(String userId) async {
    var response =
        await curd.postRequest(AppLink.viewFavourite, {"id": userId});
    return response.fold((l) => l, (r) => r);
  }
}
