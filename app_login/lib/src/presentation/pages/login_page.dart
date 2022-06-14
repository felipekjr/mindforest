import 'package:app_login/src/presentation/controllers/login_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({ 
    Key? key 
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = GetIt.instance<LoginController>();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  void dispose() {
    controller.state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      state: controller.state, 
      onError: (String m) {}, 
      onSuccess: (String m) {
        Navigator.pushNamed(context, Routes.groups);
      },
      children: [
        Center(child: Image.asset('assets/logo.png', width: 100, height: 100,)),
        Column(
          children: [
            carouselSlide(),
            const SizedBox(height: Spacing.x3),
            indicators(),
          ],
        ),
        button()
      ]
    );
  }

  ValueListenableBuilder<UIState> button() {
    return ValueListenableBuilder(
      valueListenable: controller.state,
      builder: (context, state, _) {
        return PrimaryButton(
          title: 'Realizar Login', 
          icon: const FaIcon(FontAwesomeIcons.google, color: Colors.white),
          onTap: controller.signInWithGoogle,
          loading: state is UILoadingState,
        );
      }
    );
  }

  Widget carouselSlide() => CarouselSlider(
    options: CarouselOptions(
      height: 270.0,
      viewportFraction: 1.0,
      autoPlay: true,
      onPageChanged: (index, _) => controller.setSlideIndex(index)
    ),
    items: controller.slides.map((slide) => Builder(
      builder: (BuildContext context) {
        return Column(
          children: [
            Image.asset(
              slide.path, 
              package: 'app_login',
              height: 200,
            ),
            const SizedBox(height: Spacing.x4),
            Center(child: Text(
              slide.description,
              style: TextStyles.normalThin(),
              textAlign: TextAlign.center,
            ))
          ]
        );
      },
    )).toList(),
  );

  Widget indicators() => AnimatedBuilder(
    animation: controller,
    builder: (context, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: controller.slides.map((e) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: controller.slideIndex == e.index ? 
                AppColors.primary : 
                AppColors.currentLine,
              shape: BoxShape.circle
            ),
          ),
        )).toList(),
      );
    }
  );
}