import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../controllers/controllers.dart';
import '../widgets/widgets.dart';

class GroupDetailsPage extends StatefulHookWidget {
  const GroupDetailsPage({Key? key}) : super(key: key);

  @override
  State<GroupDetailsPage> createState() => _GroupDetailsPageState();
}

class _GroupDetailsPageState extends State<GroupDetailsPage>  with SingleTickerProviderStateMixin {
  final controller = GetIt.instance<GroupDetailsController>();
  late final AnimationController animationController;
  late final animationCounter;

  @override
  void initState() {
    controller.init();
    animationController = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animationCounter = Tween<double>(
      begin: 0,
      end: controller.currentGroup.totalScore.toDouble()
    ).animate(CurvedAnimation(parent: animationController, curve: Curves.bounceInOut));

    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.closeNotifiers();
  }

  void onSuccess(BuildContext context, UISuccessState state, ) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.purple,
      content: Text(state.description),
    ));
    if (state.shouldNavigate) {
      Navigator.pop(context);
    }
  }

  Color _getScoreColor(double value) {
    if (value <= 30) {
      return AppColors.grey;
    } else if (value > 30 && value <= 60) {
      return AppColors.secondary;
    }
    return AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      title: 'Detalhes do grupo',
      onError: (String message) => showDialog(context: context, builder: (context) => ErrorDialog(message: message)),
      onSuccess: (String message) => onSuccess(context, controller.state.value as UISuccessState) ,
      state: controller.state,
      children: [
        editableTitleRow(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.x4),
          child: ShadowedContainer(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: Spacing.x2),
                  Text('Pontuação média', style: TextStyles.normalThin()),
                  const SizedBox(height: Spacing.x2),
                  animatedCounter(),
                  Center(
                    child: Lottie.asset(
                      'assets/animated_tree.json', 
                      package: 'common_ui',
                      height: 130
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        deleteButton()
      ],
    );
  }

  AnimatedBuilder animatedCounter() => AnimatedBuilder(
    animation: animationController,
    builder: (context, _) {
      final value = animationCounter.value as double;
      return Text(
        value.toStringAsFixed(1),
        style: TextStyles.titleLarge(color: _getScoreColor(value)),
      );
    }
  );

  AnimatedBuilder deleteButton() => AnimatedBuilder(
    animation: controller,
    builder: (context, _) => SecondaryButton(
      title: 'Apagar',
      color: AppColors.red,
      onTap: controller.delete,
    )
  );

  Widget editableTitleRow() {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return EditableTitleRow(controller: controller);
      }
    );
  }
}
