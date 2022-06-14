import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';
import '../controllers/controllers.dart';

class GroupDetailsPage extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      title: 'Detalhes do grupo',
      onError: (String message) {
        showDialog(
            context: context,
            builder: (context) => ErrorDialog(message: message));
      },
      onSuccess: (String message) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.purple,
          content: Text(message),
        ));
        Navigator.pop(context);
      },
      state: controller.state,
      children: [
        Column(
          children: [
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

  Row editableTitleRow() {
    return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.currentGroup.name,
                style: TextStyles.title(),
              ),
              IconButton(
                onPressed: () {}, 
                splashRadius: 16,
                icon: FaIcon(FontAwesomeIcons.pencil, size: 16, color: AppColors.black,)
              )
            ],
          );
  }
}
