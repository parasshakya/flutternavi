import 'package:flutter/material.dart';
import 'package:flutternavi/feature_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutternavi/home_screen.dart';

void main() {
  runApp(const MainApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen(), routes: [
      GoRoute(
        path: 'feature/:name',
        builder: (context, state) {
          return FeatureScreen(
            featureName: state.pathParameters["name"] ?? 'No feature name',
          );
        },
      ),
    ]),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: _router);
  }
}
