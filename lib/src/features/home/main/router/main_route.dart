import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../view/screen/main_screen.dart';
import '../../learn/view/screen/learn_screen.dart';
import '../../practice/view/screen/practice_screen.dart';
import '../../progress/view/screen/progress_screen.dart';

// Shell route for bottom navigation
final mainShellRoute = ShellRoute(
  builder: (context, state, child) => MainScreen(child: child),
  routes: [
    GoRoute(
      path: "/home",
      builder: (_, __) => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 64),
            SizedBox(height: 16),
            Text('Home Content'),
          ],
        ),
      ),
    ),
    GoRoute(path: "/learn", builder: (_, __) => const LearnScreen()),
    GoRoute(
      path: "/quran",
      builder: (_, __) => const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.auto_stories, size: 64),
            SizedBox(height: 16),
            Text('Quran Content'),
          ],
        ),
      ),
    ),
    GoRoute(path: "/practice", builder: (_, __) => const PracticeScreen()),
    GoRoute(path: "/progress", builder: (_, __) => const ProgressScreen()),
  ],
);
