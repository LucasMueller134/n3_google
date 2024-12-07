import 'package:flutter/material.dart';
import 'package:google_auth_test/src/modules/home/home_page.dart';

import '../../core/services/services.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late final IGoogleAuthService _googleAuthService;

  @override
  void initState() {
    super.initState();

    _googleAuthService = ServiceLocator.instance.get<IGoogleAuthService>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            final result = await _googleAuthService.signIn();

            if (result.isSuccess) {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    userAuthCredential: result.success,
                  ),
                ),
              );
              return;
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(result.error.message),
              ),
            );
          },
          child: Text('Clique para logar com o Google'),
        ),
      ),
    );
  }
}
