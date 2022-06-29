import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
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
      children: [
        Text(
          'Bem vindo!',
          style: TextStyles.header,
        ),
        Column(
          children: [
            groupsButton(),
            const SizedBox(
              height: Spacing.x3,
            ),
            personalProgress(),
            const SizedBox(
              height: Spacing.x3,
            ),
            learn()
          ],
        ),
        SecondaryButton(title: 'Nova análise', onTap: () {})
      ],
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
            const SizedBox(
              width: Spacing.x2,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Meus Grupos',
                    style: TextStyles.medium(color: AppColors.black),
                  ),
                  const SizedBox(height: Spacing.x1,),
                  Text(
                    'Encontre informações importantes sobre a saúde mental de um grupo',
                    style: TextStyles.smallThin(),
                  ),                  const SizedBox(height: Spacing.x1,),

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

  ShadowedContainer personalProgress() => ShadowedContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/tree_health.png',
                  width: 75,
                  height: 75,
                ),
                Text(
                  'Minha árvore',
                  style: TextStyles.medium(),
                )
              ],
            ),
                              const SizedBox(height: Spacing.x1,),

            const Text('Cuide da sua árvore diariamente'),
          ],
        ),
      );
  ShadowedContainer learn() => ShadowedContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/cactus.png',
                  width: 60,
                  height: 60,
                ),
                const SizedBox(
                  width: Spacing.x2,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Aprendizado',
                        style: TextStyles.medium(color: AppColors.secondary),
                      ),
                                        const SizedBox(height: Spacing.x1,),

                      Text(
                        'Aprenda mais sobre saúde mental em nossa plataforma',
                        style: TextStyles.smallThin(),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
}
