import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final String? initialValue;

  const SearchScreen({super.key, this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextFormField(
          initialValue: initialValue,
        ),
      ),
    );
  }
}
