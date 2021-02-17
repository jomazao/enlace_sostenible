import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeScreenProvider = ChangeNotifierProvider<HomeScreenBloc>((_) {
  return HomeScreenBloc();
});

class HomeScreenBloc extends ChangeNotifier {
  final _firebaseAuth = FirebaseAuth.instance;
  String verificationId;
  bool loading = false;
  bool codeSent = false;
  bool verified = false;

  void verifyNumber(String phoneNumber) {
    loading = true;
    notifyListeners();
    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+57$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) async {
        // ANDROID ONLY!

        // Sign the user in (or link) with the auto-generated credential
        await _firebaseAuth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int resendToken) {
        loading = false;
        this.verificationId = verificationId;
        codeSent = true;
        notifyListeners();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
        notifyListeners();
      },
    );
  }

  void logIn(String smsCode) async {
    loading = true;
    notifyListeners();

    final phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);
    // Sign the user in (or link) with the credential
    await _firebaseAuth.signInWithCredential(phoneAuthCredential).then((value) {
      verified = true;
    }).timeout(Duration(seconds: 15), onTimeout: null);

    loading = false;
    notifyListeners();
  }
}
