import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_app/models/user_model.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  Future<UserModel> signInWithEmailAndPass(String eMail, String pass) async {
    try {
      UserCredential credential =
          await _fAuth.signInWithEmailAndPassword(email: eMail, password: pass);
      User user = credential.user;
      return UserModel.fromFirebase(user);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return null;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return null;
      }
    }
  }

  // ignore: missing_return
  Future<UserModel> registerWithEmailAndPass(String eMail, String pass) async {
    try {
      UserCredential credential = await _fAuth.createUserWithEmailAndPassword(
          email: eMail, password: pass);
      User user = credential.user;
      return UserModel.fromFirebase(user);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      if (e.code == 'email-already-in-use') {
        print('email-already-in-use');
        return null;
      } else if (e.code == 'weak-password') {
        print('weak-password');
        return null;
      }
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
