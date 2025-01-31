import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final platform = MethodChannel("com.paras.flutternavi/features");

  List<String> featureNames = ["Fire Alert", "Harassment Alert"];

  @override
  void initState() {
    platform.setMethodCallHandler((MethodCall call) async {
      if (call.method == "feature") {
        String featureName = call.arguments;
        if (featureName.isNotEmpty) {
          context.go("/feature/$featureName");
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 10.0, // Space between columns
          mainAxisSpacing: 10.0, // Space between rows
        ),
        itemCount: featureNames.length, // Total number of items
        itemBuilder: (context, index) {
          final featureName = featureNames[index];
          return GestureDetector(
            onTap: () {
              context.go('/feature/$featureName');
            },
            child: Card(
              color: Colors.teal,
              child: Center(
                child: Text(
                  featureNames[index],
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
