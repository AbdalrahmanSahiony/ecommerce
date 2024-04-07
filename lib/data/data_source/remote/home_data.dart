import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class HomeData {
  Curd curd = Curd();
  HomeData(this.curd);
  getHomeData() async {
    var response = await curd.postRequest(AppLink.home, {});
    return response.fold((l) => l, (r) => r);
  }

  searchData(search) async {
    var response =
        await curd.postRequest(AppLink.searchItem, {"search": search});
    return response.fold((l) => l, (r) => r);
  }

  getItemsTopSelling() async {
    var response = await curd.postRequest(AppLink.itemTopSelling, {});
    return response.fold((l) => l, (r) => r);
  }
}
