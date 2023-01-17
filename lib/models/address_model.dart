class AddressModel {
  late int? _id;
  late String _addressType;
  late String? _contactPerson;
  late String? _contactPersonMobile;
  late String _address;
  late String _latitude;
  late String _longitude;

  AddressModel(
      {id,
      required addressType,
      contactPerson,
      contactPersonMobile,
      required address,
      required latitude,
      required longitude})
  {
    _id = id;
    _addressType = addressType;
    _contactPerson = contactPerson;
    _contactPersonMobile = contactPersonMobile;
    _address = address;
    _latitude = latitude;
    _longitude = longitude;
  }
  String get address => _address;
  String get addressType => _addressType;
  String? get contactPerson => _contactPerson;
  String? get contactPersonMobile => _contactPersonMobile;


}
