import 'package:enlace_sostenible/src/features/restaurant/ui/screens/home_screen/home_screen_bloc.dart';
import 'package:enlace_sostenible/src/features/restaurant/ui/screens/register/register_bloc.dart';
import 'package:enlace_sostenible/src/features/restaurant/ui/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnterScreen extends ConsumerWidget {
  final mobileNumberController = TextEditingController();
  final codeController = TextEditingController();
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final bloc = watch(homeScreenProvider);
    final registerBloc = watch(registerProvider);
    if (bloc.verified) {
      Future.delayed(Duration.zero, () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => RegisterScreen()));
      });
    }
    final phoneForm = Column(
      children: [
        Text('Ingresa tu número de celular'),
        TextField(
          controller: mobileNumberController,
        ),
        FlatButton(
            onPressed: () {
              registerBloc.phoneNumber = mobileNumberController.text;
              bloc.verifyNumber(mobileNumberController.text);
            },
            child: Text('Enviar mensaje'))
      ],
    );
    final codeForm = Column(
      children: [
        Text('Ingresa el código que recibiste'),
        TextField(
          controller: codeController,
        ),
        FlatButton(
            onPressed: () {
              bloc.logIn(codeController.text);
            },
            child: Text('Verificar'))
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Enlace Sostenible'),
      ),
      body: bloc.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : bloc.codeSent
              ? codeForm
              : phoneForm,
    );
  }
}
