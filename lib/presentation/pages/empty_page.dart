import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  static const routeName = 'not-found';

  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Page not found!!!'),
        ),
      ),
    );
  }
}
