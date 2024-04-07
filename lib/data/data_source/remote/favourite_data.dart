import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class FavouriteData {
  Curd curd;
  FavouriteData(this.curd);
  addFavourite(String userId, String itemId) async {
    var response = await curd.postRequest(
        AppLink.addFavourite, {"user_id": userId, "favourite_itemsid": itemId});
    return response.fold((l) => l, (r) => r);
  }

  removeFavourite(String userId, String itemId) async {
    var response = await curd.postRequest(AppLink.removeFavourite,
        {"user_id": userId, "favourite_itemsid": itemId});
    return response.fold((l) => l, (r) => r);
  }

  deleteFavId(id) async {
    var response = await curd.postRequest(AppLink.deleteFavId, {"id": id});
    return response.fold((l) => l, (r) => r);
  }
}
