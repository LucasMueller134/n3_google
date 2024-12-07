import 'package:firebase_auth/firebase_auth.dart';

import '../user_auth_credential.dart';

class UserAuthCredentialAdapter {
  static UserAuthCredential fromFirebase(User user) {
    return UserAuthCredential(
      id: user.uid,
      isAnonymous: user.isAnonymous,
      name: user.displayName,
      email: user.email,
      isEmailVerified: user.emailVerified,
      phone: user.phoneNumber,
    );
  }
}
