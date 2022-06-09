
import 'package:common_deps/common_deps.dart';
import 'package:core/helpers/helpers.dart';
import 'package:flutter/material.dart';

class LoginController extends BaseController {
  LoginController() {
    state = ValueNotifier(const UIInitialState());
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final res = await FirebaseAuth.instance.signInWithCredential(credential);

    state.value = UISuccessState<UserCredential>('Login realizado com sucesso!', entity: res);
  }
}