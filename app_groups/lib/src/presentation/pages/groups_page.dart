import 'package:app_groups/src/presentation/controllers/controllers.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = GroupsController();
    return BasePageWidget(
      onError: () {  },
      onSuccess: (String message) {  },
      state: controller.state,
      children: [
        Center(child: Image.asset('assets/logo.png', width: 100, height: 100,)),
      ],
    );
  }
}