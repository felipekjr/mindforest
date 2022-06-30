import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
import 'package:common_user/common_user.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import '../../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = GetIt.instance<HomeController>();
  final userController = GetIt.I<UserSessionService>();
  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      title: 'Início',
      state: controller.state,
      onError: (String m) {},
      onSuccess: (String m) {},
      actionButton: floatButton(),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Spacing.x2),
            Text(
              'Bem vindo, ${userController.currentUser?.displayName}!',
              style: TextStyles.sectionTitle(color: AppColors.secondary),
            ),
            const SizedBox(height: Spacing.x3),
            groupsButton(),
            const SizedBox(height: Spacing.x3),
            personalProgress(),
            const SizedBox(height: Spacing.x3),
            learn()
          ],
        ),
      ],
    );
  }

  FloatingActionButton floatButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.chat);
      },
      child: Container(
        width: 60,
        height: 60,
        child: const Icon(
          Icons.chat_sharp,
          size: 25,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.gradient,
        ),
      ),
    );
  }

  ShadowedContainer groupsButton() {
    return ShadowedContainer(
      onTap: () => Navigator.pushNamed(context, Routes.groups),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Spacing.x2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/team.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(width: Spacing.x2),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meus Grupos',
                    style: TextStyles.medium(color: AppColors.black),
                  ),
                  const SizedBox(height: Spacing.x1),
                  Text(
                    'Encontre informações importantes sobre a saúde mental de um grupo',
                    style: TextStyles.small(color: AppColors.grey),
                  ),
                  const SizedBox(height: Spacing.x1),
                  Text(
                    'Ver mais',
                    style: TextStyles.smallBold(color: AppColors.primary),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  HomeModuleButton personalProgress() {
    return HomeModuleButton(
      left: Image.asset(
        'assets/tree_health.png',
        width: 60,
        height: 60,
      ),
      title: Text(
        'Histórico de respostas',
        style: TextStyles.medium(color: AppColors.black),
      ),
      subtitle: Text(
        'Monitore seu progresso de forma simples e rápida',
        style: TextStyles.small(color: AppColors.grey),
      ),
    );
  }

  HomeModuleButton learn() {
    return HomeModuleButton(
      left: Image.asset(
        'assets/cactus.png',
        width: 60,
        height: 60,
      ),
      title: Text(
        'Aprendizado',
        style: TextStyles.medium(color: AppColors.black),
      ),
      subtitle: Text(
        'Aprenda mais sobre saúde mental em nossa plataforma',
        style: TextStyles.small(color: AppColors.grey),
      ),
    );
  }
}

class HomeModuleButton extends StatelessWidget {
  final Widget left;
  final Widget title;
  final Widget subtitle;

  const HomeModuleButton(
      {Key? key,
      required this.left,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShadowedContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              left,
              const SizedBox(
                width: Spacing.x2,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title,
                    const SizedBox(
                      height: Spacing.x1,
                    ),
                    subtitle
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
