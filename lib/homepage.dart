import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String id = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Hello Zignuts'),
        ),
      ),
    );
  }
}
