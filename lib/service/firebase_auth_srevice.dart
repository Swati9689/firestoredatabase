
import 'package:eventapp/service/firebase_db_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseDbService _firebaseDbService = FirebaseDbService();

  Future<User?> authUser(String username, String password)async {
    try {
      final UserCredential response = await _auth.signInWithEmailAndPassword(
          email: username, password: password);
      if (response.user != null) {
        return response.user;
      }
      return null;
    } catch (e) {
      print("Error While Authenticating $e");
      return null;
    }
  }

  Future<User?> registerUser(String username, String password)async {
    try {
      final UserCredential response = await _auth.createUserWithEmailAndPassword(
          email: username, password: password);
      if (response.user != null) {
        await  _firebaseDbService.createDatabaseForUser(username);


        return response.user;
      }
      return null;
    } catch (e) {
      print("Error While Registering $e");
      return null;
    }
  }
}











