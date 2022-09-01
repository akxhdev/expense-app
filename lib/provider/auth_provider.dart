import 'package:expense_app/exception/app_exception.dart';
import 'package:expense_app/exception/invalid_email.dart';
import 'package:expense_app/exception/user_disabled.dart';
import 'package:expense_app/exception/user_not_found.dart';
import 'package:expense_app/exception/wrong_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final GoogleAuthProvider _googleAuthProvider;
  User? _user;

  User? get user => _user ?? _firebaseAuth.currentUser;

  AuthProvider(this._firebaseAuth, this._googleAuthProvider);

  // sign in with google
  Future<void> signInWithGoogle() async {
    var credential =
        await _firebaseAuth.signInWithAuthProvider(_googleAuthProvider);

    _user = credential.user;
    notifyListeners();
  }

  // sign in with email and password
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      var credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      _user = credential.user;

      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e);
    } catch (e) {
      throw AppException();
    }
  }

  // sign up with email and password
  Future<void> signUpWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      var credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      _user = credential.user;
      await updateDisplayName(name);
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      _handleFirebaseAuthException(e);
    } catch (e) {
      throw AppException();
    }
  }

  // sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    _user = null;
    notifyListeners();
  }

  // update display name
  Future<void> updateDisplayName(String name) async {
    if (_user == null) return;

    await _user!.updateDisplayName(name);
  }

  // auth exception handler
  void _handleFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case "invalid-email":
        throw InvalidEmailException();
      case "user-disabled":
        throw UserDisabledException();
      case "user-not-found":
        throw UserNotFoundException();
      case "wrong-password":
        throw WrongPasswordException();
    }
  }
}
