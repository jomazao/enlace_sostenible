import 'package:enlace_sostenible/src/features/restaurant/ui/screens/home_screen/home_screen.dart';
import 'package:enlace_sostenible/src/features/restaurant/ui/screens/register/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerWidget {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final bloc = watch(registerProvider);
    if (bloc.registered) {
      Future.delayed(Duration.zero, () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      });
    }
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(bloc.phoneNumber),
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'Correo Electrónico'),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Nombres'),
            ),
            TextField(
              controller: surnameController,
              decoration: InputDecoration(hintText: 'Apellidos'),
            ),
            FlatButton(
                onPressed: () {
                  bloc.registerCoworker(emailController.text,
                      nameController.text, surnameController.text);
                },
                //      bloc.logIn(codeController.text);},
                child: Text('Registrarse'))
          ],
        ),
      ),
    );
  }
}
