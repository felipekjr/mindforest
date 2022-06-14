import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart';

import '../controllers/controllers.dart';

class EditableTitleRow extends StatelessWidget {
  const EditableTitleRow({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final GroupDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        !controller.isEditing 
          ? Text(
              controller.currentGroup.name,
              style: TextStyles.title(
                color: controller.currentGroup.isActive ? AppColors.primary : AppColors.grey
              ),
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
          padding: const EdgeInsets.all(0),
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
}