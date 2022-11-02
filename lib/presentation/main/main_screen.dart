import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          child: const Text('Log-out'),
        ),
      ),
    );
  }
}
