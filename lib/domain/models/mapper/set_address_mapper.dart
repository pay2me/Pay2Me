class SetAddressMapper {
  String? addressCity;
  String? addressState;
  String? addressNeighborhood;
  String? addressCEP;
  String? addressDescription;
  String? addressNumber;

  SetAddressMapper({
    this.addressCity,
    this.addressState,
    this.addressNeighborhood,
    this.addressCEP,
    this.addressDescription,
    this.addressNumber,
  });

  SetAddressMapper.MapFromJson(Map<String, dynamic> json) {
    addressCity = json['city'];
    addressState = json['state'];
    addressNeighborhood = json['neighborhood'];
    addressCEP = json['zipcode'];
    addressDescription = json['description'];
    addressNumber = json['number'];
  }

  Map<String, dynamic> jsonFromMap() => {
        'addressCity': addressCity,
        'addressState': addressState,
        'addressNeighborhood': addressNeighborhood,
        'addressCEP': addressCEP,
      };
}
