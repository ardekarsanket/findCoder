import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  late final FirebaseAuth _firebaseAuth;
  late final Firestore _firestore;

  // :  <- Initializer List(Used to intialize final variables)
  UserRepository({FirebaseAuth? firebaseAuth, Firestore? firestore})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
        _firestore = firestore ?? Firestore.instance;

  // method to allow users to sign in
  Future<void> signInWithEmail(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  // method to check if user is first time visitor or not
  Future<bool> isFirstTime(String userId) async {
    late bool exist;
    await Firestore.instance
        .collection('users')
        .document(userId)
        .get()
        .then((user) {
      exist = user.exists;
    });
    return exist;
  }

  // method for sign up
  Future<AuthResult> signUpWithEmail(String email, String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  // method for log out
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

  // method to check if user is already logged in
  Future<bool> isSignedIn() async {
    final currentUser = _firebaseAuth.currentUser();
    // ignore: unnecessary_null_comparison
    return currentUser != null;
  }

  // method to get current user's id
  Future<String> getUser() async {
    return (await _firebaseAuth.currentUser()).uid;
  }
}
