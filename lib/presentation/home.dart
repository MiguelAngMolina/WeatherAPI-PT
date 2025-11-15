import 'package:flutter/material.dart';
import '../config/flavors/flavors.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(F.title)),
      body: Center(child: Text('Hola ${F.title}')),
    );
  }
}
