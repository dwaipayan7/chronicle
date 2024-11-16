
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/auth_page.dart';



class AppRouter {
  static final router = GoRouter(
    initialLocation: AuthPage.route, // Set initial route
    routes: [
      GoRoute(
        path: AuthPage.route,
        builder: (context, state) => const AuthPage(),
      ),
    ],
  );
}
