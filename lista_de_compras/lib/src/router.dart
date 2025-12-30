import 'package:go_router/go_router.dart';

import 'pages/notification/notification_page.dart';
import 'pages/onboarding/onboarding_page.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => const OnboardingPage()),
    GoRoute(
      path: '/notifications',
      builder: (context, state) => const NotificationPage(),
    ),
  ],
);
