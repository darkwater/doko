import 'package:go_router/go_router.dart';

import 'map.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const TheMap(),
    ),
    GoRoute(
      path: '/saved',
      builder: (context, state) => const TheMap(
        saved: true,
      ),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const TheMap(
        search: true,
      ),
    ),
  ],
);
