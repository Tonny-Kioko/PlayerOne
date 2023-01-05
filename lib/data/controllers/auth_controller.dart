import 'package:get/get.dart';
import 'package:playerone/data/repository/auth_repository.dart';
import 'package:playerone/models/sign_up_model_body.dart';

class AuthController extends GetxController implements GetxService{
 final AuthRepo authRepo;

 AuthController({required this.authRepo});

 bool _isLoading = false;
 bool get isLoading => _isLoading;

 registration(SignUpBody signUpBody){
  _isLoading = true;

 }
}