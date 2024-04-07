class OrdersModel {
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
  int? addressId;
  int? addressUserid;
  String? city;
  String? street;
  String? name;

  OrdersModel(
      {this.ordersId,
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
      this.addressId,
      this.addressUserid,
      this.city,
      this.street,
      this.name});

  OrdersModel.fromJson(Map<String, dynamic> json) {
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
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    city = json['city'];
    street = json['street'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['address_id'] = this.addressId;
    data['address_userid'] = this.addressUserid;
    data['city'] = this.city;
    data['street'] = this.street;
    data['name'] = this.name;
    return data;
  }
}
