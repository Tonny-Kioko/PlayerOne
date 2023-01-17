import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:playerone/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_client.dart';

class LocationRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  LocationRepo({required this.apiClient, required this.sharedPreferences});

 Future<Response>  getAddressfromGeoCode(LatLng latLng) async {
    return await apiClient.getData("${AppConstants.GEOCODE_URI}"
    '?lat = ${latlng.latitude}'&lng= ${latlng.longitude}
    );
  }
}