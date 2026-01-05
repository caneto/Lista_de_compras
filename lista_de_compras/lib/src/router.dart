import 'package:go_router/go_router.dart';

import 'pages/auth/email_login_page.dart';
import 'pages/auth/login_page.dart';
import 'pages/home/home_page.dart';
import 'pages/notification/notification_page.dart';
import 'pages/onboarding/onboarding_page.dart';
import 'pages/profile/appearance_page.dart';
import 'pages/profile/settings_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const OnboardingPage()),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
      routes: [
        GoRoute(
          path: 'email',
          builder: (context, state) => const EmailLoginPage(),
        ),
      ],
    ),
    GoRoute(path: '/home', builder: (context, state) => const HomePage()),
    GoRoute(
      path: '/settings',
      builder: (context, state) => const SettingsPage(),
      routes: [
        GoRoute(
          path: 'appearance',
          builder: (context, state) => const AppearancePage(),
        ),
      ],
    ),
  ],
);
