import 'package:app_login/src/presentation/controllers/login_controller.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/widgets/base_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = LoginController();

  LoginPage({ 
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      state: controller.state, 
      onError: () {}, 
      onSuccess: (String m) {
        print('oi');
      },
      children: [
        Center(child: Image.asset('assets/logo.png', width: 150, height: 150,)),
        PrimaryButton(title: 'Entrar', onTap: controller.signInWithGoogle)
      ]
    );
  }
}