import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  forgotPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on Exception {
      throw Exception();
    }
  }

  login({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on Exception {
      throw Exception();
    }
  }

  logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on Exception {
      throw Exception();
    }
  }

  // Getter isLoggedInStream
  Stream<bool> get isLoggedInStream =>
      _auth.authStateChanges().map((user) => user != null);
}
