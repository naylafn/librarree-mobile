import 'package:flutter/material.dart';
import 'package:librarree/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) {
          CookieRequest request = CookieRequest();
          return request;
        },
        child: MaterialApp(
          title: 'Librarree',
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.blue, // Use predefined MaterialColor
            ).copyWith(
              secondary: const Color(0xFF00B4D8), // Use Color for secondary
            ),
          ),
          home: const LoginPage(),
        ));
  }
}
