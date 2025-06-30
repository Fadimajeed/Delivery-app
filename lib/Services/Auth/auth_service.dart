import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // get instance of firebase auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // get current user
  User? getcurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // sign in
  Future<UserCredential> singInWithEmailAndPassword(
    String email,
    password,
  ) async {
    try {
      //try sign user in
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign up
  Future<UserCredential> signUpnWithEmailAndPassword(
    String email,
    password,
  ) async {
    try {
      //try sign user un
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // sign out
  Future<void> signOut() async => await _firebaseAuth.signOut();
}
