class SetAddressMapper {
  String? addressCity;
  String? addressState;
  String? addressNeighborhood;
  String? addressCEP;

  SetAddressMapper({
    this.addressCity,
    this.addressState,
    this.addressNeighborhood,
    this.addressCEP,
  });

  SetAddressMapper.MapFromJson(Map<String, dynamic> json) {
    addressCity = json['addressCity'];
    addressState = json['addressState'];
    addressNeighborhood = json['addressNeighborhood'];
    addressCEP = json['addressCEP'];
  }

  Map<String, dynamic> jsonFromMap() => {
    'addressCity': addressCity,
    'addressState': addressState,
    'addressNeighborhood': addressNeighborhood,
    'addressCEP': addressCEP,
  };
}
