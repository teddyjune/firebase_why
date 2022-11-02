import 'package:firebase_why/presentation/write/write_screen.dart';
import 'package:firebase_why/presentation/write/write_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'auth_gate/auth_gate.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const AuthGate();
      },
    ),
    GoRoute(
      path: '/write',
      builder: (BuildContext context, GoRouterState state) {
        return ChangeNotifierProvider(
          create: (_) => WriteViewModel(),
          child: const WriteScreen(),
        );
      },
    ),
  ],
);
