import 'package:firebase_auth/firebase_auth.dart';
import 'package:photo_social_network/domain/repositories/auth_service.dart';

class AuthServiceImpl implements AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  @override
  Future<void> logout() async {
    firebaseAuth.signOut();
  }

  @override
  Future<void> sendEmailVerification() async {
    if (firebaseAuth.currentUser != null) {
      await firebaseAuth.currentUser!.sendEmailVerification();
    }
  }

  @override
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    return firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) {
    return firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
