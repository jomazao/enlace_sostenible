import 'package:enlace_sostenible/src/features/restaurant/data/repositories/coworker_repository.dart';
import 'package:enlace_sostenible/src/features/restaurant/models/coworker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerProvider = ChangeNotifierProvider<RegisterBloc>((_) {
  return RegisterBloc();
});

class RegisterBloc extends ChangeNotifier {
  String phoneNumber;
  final auth = FirebaseAuth.instance;
  final repository = CoworkerRepository();
  var registered = false;

  void registerCoworker(String email, String name, String surname) async {  
    final coworker = Coworker(
        uid: auth.currentUser.uid,
        phoneNumber: phoneNumber,
        name: name,
        email: email,
        surname: surname);

    await repository.createCoworker(coworker);
    registered = true;
    notifyListeners();
  }
}
