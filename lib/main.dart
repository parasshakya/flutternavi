import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:flutternavi/home_screen.dart';
import 'package:flutternavi/search_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  static const platform = MethodChannel('com.paras.flutternavi/features');
  String featureName = "";
  TextEditingController textEditingController = TextEditingController();

  // final GoRouter _router = GoRouter(
  //   initialLocation: '/',
  //   routes: [
  //     GoRoute(path: '/', builder: (context, state) => HomeScreen()),
  //     GoRoute(
  //       path: '/search/:name',
  //       builder: (context, state) {
  //         return SearchScreen(
  //           initialValue: state.pathParameters["name"],
  //         );
  //       },
  //     ),
  //   ],
  // );
  @override
  void initState() {
    super.initState();

    platform.setMethodCallHandler((MethodCall call) async {
      if (call.method == "feature") {
        setState(() {
          featureName = call.arguments ?? "No feature recieved";
        });
        // context.go('/search/$searchQuery');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(child: Text(featureName)),
    ));
  }
}
