import 'package:go_router/go_router.dart';
import 'package:jamnation_mobile/screens/home_screen.dart';
import 'package:jamnation_mobile/screens/splash_screen.dart';
import 'package:jamnation_mobile/screens/auth/login_screen.dart';

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/splash',
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
