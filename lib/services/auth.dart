import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_app/models/user_model.dart';

class AuthService {
  final FirebaseAuth _fAuth = FirebaseAuth.instance;

  // ignore: missing_return
  Future<UserModel> signInWithEmailAndPass(String eMail, String pass) async {
    try {
      UserCredential credential =
          await _fAuth.signInWithEmailAndPassword(email: eMail, password: pass);
      User user = credential.user;
      return UserModel.fromFirebase(user);
    } on FirebaseAuthException catch (e) {
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
      return null;
    }
  }

  Future logOut() async {
    await _fAuth.signOut();
  }
}
