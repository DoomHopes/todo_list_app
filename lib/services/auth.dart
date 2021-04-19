import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_app/models/user_model.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;
  String errorMessage;

  // ignore: missing_return
  Future<UserModel> signInWithEmailAndPass(String eMail, String pass) async {
    try {
      UserCredential credential =
          await _fAuth.signInWithEmailAndPassword(email: eMail, password: pass);
      User user = credential.user;
      return UserModel.fromFirebase(user);
    } on FirebaseAuthException catch (error) {
      print(error.toString());
      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        default:
          errorMessage = "ok";
      }
      return null;
    }
  }

  // ignore: missing_return
  Future<UserModel> registerWithEmailAndPass(String eMail, String pass) async {
    try {
      UserCredential credential = await _fAuth.createUserWithEmailAndPassword(
          email: eMail, password: pass);
      User user = credential.user;
      return UserModel.fromFirebase(user);
    } on FirebaseAuthException catch (error) {
      print(error.toString());
      switch (error.code) {
        case "email-already-in-use":
          errorMessage = "Your email address already in use.";
          break;
        case "invalid-email":
          errorMessage = "Your email is invalid.";
          break;
        case "operation-not-allowed":
          errorMessage = "Operation no allowed.";
          break;
        case "weak-password":
          errorMessage = "Your password is weak.";
          break;
        default:
          errorMessage = "ok";
      }
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }

  Stream<UserModel> get currentUser {
    return _fAuth
        .authStateChanges()
        .map((User user) => user != null ? UserModel.fromFirebase(user) : null);
  }
}
