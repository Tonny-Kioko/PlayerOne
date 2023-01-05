import 'package:get/get.dart';
import 'package:playerone/data/repository/auth_repository.dart';
import 'package:playerone/models/response_models.dart';
import 'package:playerone/models/sign_up_model_body.dart';

class AuthController extends GetxController implements GetxService{
 final AuthRepo authRepo;

 AuthController({required this.authRepo});

 bool _isLoading = false;
 bool get isLoading => _isLoading;

 registration(SignUpBody signUpBody) async {
  _isLoading = true;
 Response response= await authRepo.registration(signUpBody);
 late ResponseModel responseModel;
 if(response.statusCode == 200){
  authRepo.saveUserToken(response.body["token"]);
  responseModel = ResponseModel(true, response.body["token"]);
 }else{
  responseModel = ResponseModel(false, response.statusText!);
 }
 _isLoading = true;
 update();
 return responseModel;

 }
}