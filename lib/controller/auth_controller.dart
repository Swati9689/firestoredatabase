
import 'package:eventapp/service/firebase_auth_srevice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AuthController extends GetxController{

  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  Future<User?> loginUser(String username, String password)async{
    return await _firebaseAuthService.authUser(username, password);
  }

  Future<User?> registerUser(String username, String password)async{
    return await _firebaseAuthService.registerUser(username, password);
  }
}




