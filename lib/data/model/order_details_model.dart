class OrderDetailsModel {
  int? cartId;
  int? cartUserid;
  int? cartItemsid;
  int? cartItemCount;
  int? cartOrder;
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
  int? itemsPriceDiscount;
  int? ordersId;
  int? ordersUserid;
  int? ordersAddress;
  int? ordersPrice;
  int? ordersType;
  int? ordersPricedelivery;
  int? ordersCoupon;
  String? ordersDatetime;
  int? ordersPaymentway;
  int? orderStatus;
  int? ordersRate;
  String? ordersNote;
  int? ordersDelivery;
  int? addressId;
  int? addressUserid;
  String? city;
  String? street;
  String? name;

  OrderDetailsModel(
      {this.cartId,
      this.cartUserid,
      this.cartItemsid,
      this.cartItemCount,
      this.cartOrder,
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
      this.itemsPriceDiscount,
      this.ordersId,
      this.ordersUserid,
      this.ordersAddress,
      this.ordersPrice,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersCoupon,
      this.ordersDatetime,
      this.ordersPaymentway,
      this.orderStatus,
      this.ordersRate,
      this.ordersNote,
      this.ordersDelivery,
      this.addressId,
      this.addressUserid,
      this.city,
      this.street,
      this.name});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    cartUserid = json['cart_userid'];
    cartItemsid = json['cart_itemsid'];
    cartItemCount = json['cart_item_count'];
    cartOrder = json['cart_order'];
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
    itemsPriceDiscount = json['items_price_discount'];
    ordersId = json['orders_id'];
    ordersUserid = json['orders_userid'];
    ordersAddress = json['orders_address'];
    ordersPrice = json['orders_price'];
    ordersType = json['orders_type'];
    ordersPricedelivery = json['orders_pricedelivery'];
    ordersCoupon = json['orders_coupon'];
    ordersDatetime = json['orders_datetime'];
    ordersPaymentway = json['orders_paymentway'];
    orderStatus = json['order_status'];
    ordersRate = json['orders_rate'];
    ordersNote = json['orders_note'];
    ordersDelivery = json['orders_delivery'];
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    city = json['city'];
    street = json['street'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['cart_userid'] = this.cartUserid;
    data['cart_itemsid'] = this.cartItemsid;
    data['cart_item_count'] = this.cartItemCount;
    data['cart_order'] = this.cartOrder;
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
    data['items_price_discount'] = this.itemsPriceDiscount;
    data['orders_id'] = this.ordersId;
    data['orders_userid'] = this.ordersUserid;
    data['orders_address'] = this.ordersAddress;
    data['orders_price'] = this.ordersPrice;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_datetime'] = this.ordersDatetime;
    data['orders_paymentway'] = this.ordersPaymentway;
    data['order_status'] = this.orderStatus;
    data['orders_rate'] = this.ordersRate;
    data['orders_note'] = this.ordersNote;
    data['orders_delivery'] = this.ordersDelivery;
    data['address_id'] = this.addressId;
    data['address_userid'] = this.addressUserid;
    data['city'] = this.city;
    data['street'] = this.street;
    data['name'] = this.name;
    return data;
  }
}
