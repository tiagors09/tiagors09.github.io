import 'package:flutter/material.dart';

import 'home.dart';

class Portifolio extends StatelessWidget {
  const Portifolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Home(),
      theme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.brown,
        ),
      ),
    );
  }
}
