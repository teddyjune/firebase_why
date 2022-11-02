import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

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
  ],
);
