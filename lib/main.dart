import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
import 'login_screen.dart';

void main() => runApp(CommerceptionApp());

class CommerceptionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Commerception',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue[800],
        scaffoldBackgroundColor: Colors.blueGrey[900],
      ),
      home: LoginScreen(),
    );
  }
}
