import 'package:get/get.dart';
import 'package:playerone/data/api/api_client.dart';
import 'package:playerone/models/login_page_body.dart';
import 'package:playerone/models/sign_up_model_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_constants.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(
        AppConstants.REGISTRATION_URI, signUpBody.toJson());
  }

  Future<Response> login(LoginBody loginBody) async {
    return await apiClient.postData(AppConstants.LOGIN_URI, loginBody.toJson());
  }

  saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}
