import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/address_model.dart';
import '../repository/location_repository.dart';

class LocationController extends GetxController implements GetxService {
  LocationRepo locationRepo;
  LocationController({required this.locationRepo});

  bool _loading = false;
  late Position _position;
  late Position _pickPosition;
  Placemark _placemark = Placemark();
  Placemark get placemark => _placemark;
  Placemark _pickPlacemark = Placemark();
  Placemark get pickPlacemark => _pickPlacemark;

  List<AddressModel> _addressList = [];
  List<AddressModel> get addressList => _addressList;
  late List<AddressModel> _allAddressList;
  List<String> _addressTypeList = ['home', 'office', 'other'];
  int _addressTypeIndex = 0;

  Position get position => _position;
  Position get pickPosition => _pickPosition;
  bool get loading => _loading;
  bool _changeAddress = true;

  late GoogleMapController _mapController;
  bool _updateAddressData = true;
  void setMapController(GoogleMapController mapController) {
    _mapController = mapController;
  }

  void updatePosition(CameraPosition position, bool fromAddress) async {
    if (_updateAddressData) {
      _loading = true;
      update();
      try {
        if (fromAddress) {
          _position = Position(
              longitude: position.target.longitude,
              latitude: position.target.latitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1);
        } else {
          _pickPosition = Position(
              longitude: position.target.longitude,
              latitude: position.target.latitude,
              timestamp: DateTime.now(),
              accuracy: 1,
              altitude: 1,
              heading: 1,
              speed: 1,
              speedAccuracy: 1);
        }

        if (_changeAddress) {
          String _address = await getAddressfromGeoCode(
              LatLng(position.target.latitude, position.target.longitude));

          fromAddress
              ? _placemark = Placemark(name: _address)
              : _pickPlacemark = Placemark(name: _address);
          print(_placemark);
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future<String> getAddressfromGeoCode(LatLng latlng) async {
    String _address = "This location is Unknown";
    Response response = await locationRepo.getAddressfromGeoCode(latlng);
    if (response.body['status'] == 'OK') {
      _address = response.body['results'][0]['formatted_address'].toString();
      //Test
      print("The address is" + _address);
    } else {
      print("Please check your Google API");
    }
    return _address;
  }

  late Map<String, dynamic> _getAddress;
  Map get getAddress => _getAddress;

  AddressModel getUserAddress() {
    late AddressModel _addressModel;

    //Converting the address to map with Json Decode
    _getAddress = jsonDecode(locationRepo.getUserAddress());
    try {
      _addressModel =
          AddressModel.fromJson(jsonDecode(locationRepo.getUserAddress()));
    } catch (e) {
      print(e);
    }
    return _addressModel;
  }

  void setAddressTypeIndex(int index){
     _addressTypeIndex = index;
     update();
  }
}
