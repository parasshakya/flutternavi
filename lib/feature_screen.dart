import 'package:flutter/material.dart';

class FeatureScreen extends StatelessWidget {
  final String featureName;
  const FeatureScreen({super.key, required this.featureName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(featureName),
      ),
      body: Center(
        child: Text(featureName),
      ),
    );
  }
}
