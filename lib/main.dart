import 'package:enlace_sostenible/src/config/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
