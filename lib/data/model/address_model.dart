class AddressModel {
  int? addressId;
  int? addressUserid;
  String? city;
  String? street;
  String? name;

  AddressModel(
      {this.addressId, this.addressUserid, this.city, this.street, this.name});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUserid = json['address_userid'];
    city = json['city'];
    street = json['street'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_userid'] = this.addressUserid;
    data['city'] = this.city;
    data['street'] = this.street;
    data['name'] = this.name;
    return data;
  }
}
