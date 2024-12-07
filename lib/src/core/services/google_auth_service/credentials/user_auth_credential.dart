class UserAuthCredential {
  final String id;
  final bool isAnonymous;
  final String? name;
  final String? email;
  final bool isEmailVerified;
  final String? phone;
  final bool isNewUser;

  const UserAuthCredential({
    required this.id,
    this.isAnonymous = true,
    this.name,
    this.email,
    this.isEmailVerified = false,
    this.phone,
    this.isNewUser = false,
  });
}
