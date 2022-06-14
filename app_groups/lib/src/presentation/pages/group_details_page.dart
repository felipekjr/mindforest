import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../controllers/controllers.dart';

class GroupDetailsPage extends StatefulHookWidget {
  const GroupDetailsPage({Key? key}) : super(key: key);

  @override
  State<GroupDetailsPage> createState() => _GroupDetailsPageState();
}

class _GroupDetailsPageState extends State<GroupDetailsPage> {
  final controller = GetIt.instance<GroupDetailsController>();

  @override
  void initState() {
    controller.init();
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

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      title: 'Detalhes do grupo',
      onError: (String message) => showDialog(context: context, builder: (context) => ErrorDialog(message: message)),
      onSuccess: (String message) => onSuccess(context, controller.state.value as UISuccessState) ,
      state: controller.state,
      children: [
        Column(
          children: [
            const SizedBox(height: Spacing.x2),
            editableTitleRow(),
            const SizedBox(height: Spacing.x2),
            Column(children: [
              Row()
            ],)
          ],
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return SecondaryButton(
              title: 'Apagar',
              color: AppColors.red,
              onTap: controller.delete,
            );
          })
      ],
    );
  }

  Widget editableTitleRow() {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            !controller.isEditing 
              ? Text(
                  controller.currentGroup.name,
                  style: TextStyles.title(),
                ) 
              : Expanded(
                child: Input(
                  label: 'Nome', 
                  hint: 'Nome do grupo', 
                  errorText: '', 
                  error: false, 
                  initialValue: controller.currentGroup.name,
                  onChanged: (String v) => controller.setGroup(controller.currentGroup.copy(name: v))
                ),
              ),
           
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                if (controller.isEditing) {
                  controller.saveChanges();
                } else {
                  controller.setIsEditing(!controller.isEditing);
                }
              },
              splashRadius: 16,
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => RotationTransition(
                  turns: child.key == const Key('icon1')
                    ? Tween<double>(begin: 1, end: 0).animate(animation)
                    : Tween<double>(begin: 0, end: 1).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                ),
                child: controller.isEditing
                  ? const FaIcon(FontAwesomeIcons.check, key: Key('icon1'), color: Colors.green)
                  : FaIcon(FontAwesomeIcons.pencil, key: const Key('icon2'), size: 16, color: AppColors.black)
                ),
              )
          ],
        );
      }
    );
  }
}
