import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:talentpitch/app/utils/connectivity.dart';

class AuthService {
  AuthService(this._firebaseAuth);
  final FirebaseAuth _firebaseAuth;

  ///signIn
  Future<dynamic> signIn(
      {required String email, required String password}) async {
    // await connectionStatus.getAuthStatus();

    try {
      return await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

  ///signUp can be UserCredential or error string code
  Future<dynamic> signUp(
      {required String email, required String password}) async {
    // await connectionStatus.getAuthStatus();

    try {
      // Returns an UserCredential
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (error) {
      return error.message;
    }
  }

  ///sendPasswordReset
  Future<String> sendPasswordReset(String email) async {
    await connectionStatus.getAuthStatus();

    String errorMessage = '';
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
          errorMessage = 'Tu correo electrónico parece que está mal escrito.';
          break;
        case 'user-not-found':
          errorMessage = 'No existe un usuario con este correo electrónico';
          break;
        default:
          errorMessage =
              'Hubo un error desconocido, por favor intenta de nuevo más tarde.';
      }
    }
    return errorMessage;
  }

  ///Change password
  Future<String> changePassword(
    String currentPassword,
    String email,
    String newPassword,
  ) async {
    await connectionStatus.getNormalStatus();

    try {
      final signInStatus =
          await signIn(email: email, password: currentPassword);

      if (signInStatus.isEmpty as bool) {
        final user = _firebaseAuth.currentUser;

        await user!.updatePassword(newPassword);

        return 'success';
      } else {
        return 'error';
      }
    } catch (err) {
      debugPrint(err.toString());
      return 'error';
    }
  }

  ///Delete User
  Future<bool> deleteUser() async {
    await connectionStatus.getAuthStatus();

    if (await getCurrentUserLocal() != null) {
      try {
        // await database.deleteDocument(_firebaseAuth.currentUser!.uid, 'users');
        await _firebaseAuth.currentUser!.delete();
        return true;
      } on FirebaseAuthException catch (e) {
        log(e.toString());
        return false;
      }
    } else {
      return false;
    }
  }

  ///SignOut
  Future<bool> signOut() async {
    await connectionStatus.getNormalStatus();

    try {
      await _firebaseAuth.signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  ///Get Currentuser
  User? getCurrentUser() {
    try {
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  ///Get Currentuser
  getCurrentUserLocal() async {
    try {
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}

final AuthService auth = AuthService(FirebaseAuth.instance);
