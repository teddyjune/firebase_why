import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_why/data/model/memo.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('메인'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => context.go('/write'),
              //go는 replace, push는 위로 올라온다.
              child: const Text('글쓰기'),
            ),
            Expanded(
              child: FirestoreListView<Memo>(
                query: _query(),
                itemBuilder: (context, snapshot) {
                  final memo = snapshot.data();
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (DismissDirection direction) {
                      FirebaseFirestore.instance
                          .collection('memos')
                          .doc(memo.uid)
                          .delete();
                    },
                    background: Container(
                      alignment: Alignment.centerLeft,
                      color: Colors.greenAccent,
                    ),
                    child: ListTile(
                      title: Text(memo.title),
                      subtitle: Text(memo.body),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Query<Memo> _query() {
    //계속 바라보는 리얼타임 코드
    return FirebaseFirestore.instance
        .collection('memos')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser?.uid ?? '')
        .withConverter<Memo>(
          fromFirestore: (snapshot, _) => Memo.fromJson(snapshot.data()!),
          toFirestore: (memo, _) => memo.toJson(),
        );
  }
}
