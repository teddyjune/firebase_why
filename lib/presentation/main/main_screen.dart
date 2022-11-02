import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('메인'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Log out'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/write'),
              //go는 replace, push는 위로 올라온다.
              child: const Text('Log out'),
            ),
          ],
        ),
      ),
    );
  }
}
