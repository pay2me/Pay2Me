class SetAddressMapper {
  String? addressId;
  String? addressDescription;
  String? addressCEP;
  String? addressStreet;
  String? addressNumber;
  String? addressComplement;
  String? addressNeighborhood;
  String? addressCity;
  String? addressState;
  String? addressCreatedAt;
  String? addressUpdateAt;
  String? addressDeleteAt;

  SetAddressMapper({
    this.addressId,
    this.addressDescription,
    this.addressCEP,
    this.addressStreet,
    this.addressNumber,
    this.addressComplement,
    this.addressNeighborhood,
    this.addressCity,
    this.addressState,
    this.addressCreatedAt,
    this.addressUpdateAt,
    this.addressDeleteAt,
  });

  SetAddressMapper.MapFromJson(Map<String, dynamic> json) {
    addressId = json['id'];
    addressDescription = json['description'];
    addressCEP = json['zipcode'];
    addressStreet = json['street'];
    addressNumber = json['number'];
    addressComplement = json['complement'];
    addressNeighborhood = json['neighborhood'];
    addressCity = json['city'];
    addressState = json['state'];
    addressCreatedAt = json['created_at'];
    addressUpdateAt = json['updated_at'];
    addressDeleteAt = json['deleted_at'];
  }

  Map<String, dynamic> jsonFromMap() => {
        'id': addressId,
        'description': addressDescription,
        'zipcode': addressCEP,
        'street': addressStreet,
        'number': addressNumber,
        'complement': addressComplement,
        'neighborhood': addressNeighborhood,
        'city': addressCity,
        'state': addressState,
        'created_at': addressCreatedAt,
        'updated_at': addressUpdateAt,
        'deleted_at': addressDeleteAt,
      };
}
