import 'package:flutter_application_19/core/classes/curd.dart';
import 'package:flutter_application_19/core/constans/app_link.dart';

class OrderArchiveData {
  Curd curd;
  OrderArchiveData(this.curd);
  getArchiveData(String userId) async {
    var response = await curd.postRequest(AppLink.archiveOrders, {
      "userId": userId,
    });
    return response.fold((l) => l, (r) => r);
  }

  orderRatingData(String orderId, double rating, String ratingNote) async {
    var response = await curd.postRequest(AppLink.orderRating, {
      "orderId": orderId,
      "rating": rating.toString(),
      "ratingNote": ratingNote,
    });
    return response.fold((l) => l, (r) => r);
  }
}
