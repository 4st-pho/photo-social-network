import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthService {
  Future<UserCredential> signUpWithEmailAndPassword(String email, String password);
  Future<UserCredential> signInWithEmailAndPassword(String email, String password);
  Future<void> sendEmailVerification();
  Future<void> logout();
}
