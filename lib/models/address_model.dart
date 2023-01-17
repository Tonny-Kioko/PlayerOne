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
      required longitude});
}
