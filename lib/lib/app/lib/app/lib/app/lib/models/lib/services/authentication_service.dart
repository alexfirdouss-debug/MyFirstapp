import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<User?> signInWithEmail(String email, String password) async {
    var credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return credential.user;
  }

  Future<User?> signUpWithEmail(String email, String password) async {
    var credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return credential.user;
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
    final userCredential = await _firebaseAuth.signInWithCredential(credential);
    return userCredential.user;
  }

  Future<User?> signInWithApple() async {
    final appleCredential = await SignInWithApple.getAppleIDCredential(scopes: [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName]);
    final oauthCredential = OAuthProvider("apple.com").credential(idToken: appleCredential.identityToken, accessToken: appleCredential.authorizationCode);
    final userCredential = await _firebaseAuth.signInWithCredential(oauthCredential);
    return userCredential.user;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
