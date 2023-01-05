import 'package:get/get.dart';
import 'package:playerone/data/repository/auth_repository.dart';

class AuthController extends GetxController implements GetxService{
 final AuthRepo authRepo;

 AuthController({required this.authRepo});
}