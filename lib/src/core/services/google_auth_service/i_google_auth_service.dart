import '../../utils/either.dart';
import 'credentials/user_auth_credential.dart';

abstract interface class IGoogleAuthService {
  AsyncResult<UserAuthCredential?> getCurrentUser();

  AsyncResult<bool> signOut();

  AsyncResult<UserAuthCredential> signIn();
}
