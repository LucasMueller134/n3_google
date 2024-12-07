import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/either.dart';
import '../../services.dart';

class GoogleAuthService implements IGoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  AsyncResult<UserAuthCredential> signIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        return left(SignInAuthException(
          message: 'Usuário cancelou o login.',
          stackTrace: StackTrace.current,
        ));
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      return right(
        UserAuthCredential(
          id: _auth.currentUser?.uid ?? '',
          email: _auth.currentUser?.email ?? '',
          name: _auth.currentUser?.displayName ?? '',
        ),
      );
    } on FirebaseAuthException catch (error, stackTrace) {
      return left(
        SignInAuthException(
          message: error.message ?? 'An error occurred while logging in.',
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  AsyncResult<UserAuthCredential?> getCurrentUser() {
    try {
      final firebaseUser = _auth.currentUser;

      if (firebaseUser == null) return right(null);

      return right(UserAuthCredentialAdapter.fromFirebase(firebaseUser));
    } on FirebaseAuthMultiFactorException catch (error, stackTrace) {
      return left(
        GetCurrentUserAuthException(
          message: error.message ?? '',
          stackTrace: stackTrace,
        ),
      );
    }
  }

  @override
  AsyncResult<bool> signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();

      return right(true);
    } on FirebaseAuthException catch (error, stackTrace) {
      return left(
        SignOutAuthException(
          message: error.message ?? 'An error occurred while signing out.',
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
