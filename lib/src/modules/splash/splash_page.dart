import 'package:flutter/material.dart';
import 'package:google_auth_test/src/core/services/google_auth_service/i_google_auth_service.dart';
import 'package:google_auth_test/src/core/services/service_locator/implementations/service_locator.dart';
import 'package:google_auth_test/src/modules/auth/auth_page.dart';

import '../home/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late final IGoogleAuthService _googleAuthService;

  @override
  void initState() {
    super.initState();

    _googleAuthService = ServiceLocator.instance.get<IGoogleAuthService>();

    _isAuthenticated(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Carregando...'),
      ),
    );
  }

  Future<void> _isAuthenticated(BuildContext context) async {
    final isAuthenticated = await _googleAuthService.getCurrentUser();

    isAuthenticated.fold(
      (error) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AuthPage()),
        );
      },
      (success) {
        if (success != null) {
          return Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomePage(
                userAuthCredential: success,
              ),
            ),
          );
        }

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AuthPage()),
        );
      },
    );
  }
}
