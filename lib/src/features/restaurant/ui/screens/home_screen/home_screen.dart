import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  final mobileNumberController = TextEditingController();
  final codeController = TextEditingController();
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('Enlace Sostenible'),
        ),
        body: SafeArea(
          child: Wrap(
            children: [
              Icon(
                Icons.restaurant,
                size: 20,
              )
            ],
          ),
        ));
  }
}
