import 'package:flutter/material.dart';
import 'package:google_auth_test/src/modules/auth/auth_page.dart';

import '../../core/services/services.dart';

class HomePage extends StatefulWidget {
  final UserAuthCredential userAuthCredential;

  const HomePage({
    super.key,
    required this.userAuthCredential,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bem-vindo, ${widget.userAuthCredential.name}'),
            Text('Email: ${widget.userAuthCredential.email}'),
            TextButton(
              child: Text('Sair'),
              onPressed: () async {
                final result = await _googleAuthService.signOut();

                if (result.isSuccess) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AuthPage()),
                  );
                  return;
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(result.error.message),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
