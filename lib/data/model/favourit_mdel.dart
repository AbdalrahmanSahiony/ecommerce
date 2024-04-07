class FavouriteModel {
  int? favouriteUsersid;
  int? favouriteItemsid;
  String? favouriteId;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDescreption;
  String? itemsDescreptionAr;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsImage;
  String? itemsDate;
  int? itemsCategories;
  int? userId;

  FavouriteModel(
      {this.favouriteUsersid,
      this.favouriteItemsid,
      this.favouriteId,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDescreption,
      this.itemsDescreptionAr,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsImage,
      this.itemsDate,
      this.itemsCategories,
      this.userId});

  FavouriteModel.fromJson(Map<String, dynamic> json) {
    favouriteUsersid = json['favourite_usersid'];
    favouriteItemsid = json['favourite_itemsid'];
    favouriteId = json['favourite_id'].toString();
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDescreption = json['items_descreption'];
    itemsDescreptionAr = json['items_descreption_ar'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsImage = json['items_image'];
    itemsDate = json['items_date'];
    itemsCategories = json['items_categories'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favourite_usersid'] = this.favouriteUsersid;
    data['favourite_itemsid'] = this.favouriteItemsid;
    data['favourite_id'] = this.favouriteId;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_descreption'] = this.itemsDescreption;
    data['items_descreption_ar'] = this.itemsDescreptionAr;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_image'] = this.itemsImage;
    data['items_date'] = this.itemsDate;
    data['items_categories'] = this.itemsCategories;
    data['user_id'] = this.userId;
    return data;
  }
}
