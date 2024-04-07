class CouponModel {
  int? coupunId;
  String? couponName;
  int? couponCount;
  int? couponDiscount;
  String? couponExpiaredate;

  CouponModel(
      {this.coupunId,
      this.couponName,
      this.couponCount,
      this.couponDiscount,
      this.couponExpiaredate});

  CouponModel.fromJson(Map<String, dynamic> json) {
    coupunId = json['coupun_id'];
    couponName = json['coupon_name'];
    couponCount = json['coupon_count'];
    couponDiscount = json['coupon_discount'];
    couponExpiaredate = json['coupon_expiaredate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupun_id'] = this.coupunId;
    data['coupon_name'] = this.couponName;
    data['coupon_count'] = this.couponCount;
    data['coupon_discount'] = this.couponDiscount;
    data['coupon_expiaredate'] = this.couponExpiaredate;
    return data;
  }
}
