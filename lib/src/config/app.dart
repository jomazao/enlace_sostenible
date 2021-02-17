import 'package:enlace_sostenible/src/features/restaurant/ui/screens/enter_screen/enter_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Material(
            child: Center(
              child: Text('Error al inicializar firebase'),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: EnterScreen(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
