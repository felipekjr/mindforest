
import 'package:common_deps/common_deps.dart';
import 'package:core/helpers/helpers.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

class LoginController extends BaseController {
  int slideIndex = 0;

  List<SlideItemEntity> slides = [
    const SlideItemEntity(
      0,
      'assets/slide1.png', 
      'Visualize e garanta a saúde mental de um grupo'
    ),
    const SlideItemEntity(
      1,
      'assets/slide2.png', 
      'Cultive sua saúde mental e acompanhe seu progresso'
    ),
    const SlideItemEntity(
      2,
      'assets/slide3.png', 
      'Plantar, semear, cultivar, fertilizar...'
    )
  ];

  Future<void> setSlideIndex(int index) async {
    slideIndex = index;
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    state.value = const UILoadingState();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final res = await FirebaseAuth.instance.signInWithCredential(credential);

    state.value = UISuccessState<UserCredential>('Login realizado com sucesso!', entity: res);
  }

  @override
  void closeNotifiers() {
    state.dispose();
  }

  @override
  void init() {
    state = ValueNotifier(const UIInitialState());
  }
}