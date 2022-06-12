import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';
import '../controllers/controllers.dart';
import '../widgets/widgets.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({ Key? key }) : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> with RouteAware {
  late GroupsController controller;

  @override
  void initState() {
    super.initState();
    controller = GetIt.instance<GroupsController>();
    controller.getAll();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  void didPop() {
    controller.getAll();
    super.didPop();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      title: 'Grupos',
      onError: (String message) {  
        showDialog(context: context, builder: (context) => ErrorDialog(message: message));
      },
      onSuccess: (String message) {  },
      state: controller.state,
      children: [
        Column(
          children: [
            topSection(),
            const SizedBox(height: Spacing.x3),
            ValueListenableBuilder<List<GroupEntity>?>(
              valueListenable: controller.groupsNotifier, 
              builder: (context, groups, _) {
                return groups == null 
                  ? const Center(child: CircularProgressIndicator())
                  : groups.isNotEmpty
                    ? groupsList(groups)
                    : const Center(child: Text('Nenhum grupo encontrado'));
              }
            )
          ],
        ),
      ],
    );
  }

  Widget topSection() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const HeaderSection(title: 'Meus grupos'),
      IconButton(
        onPressed: () => Navigator.pushNamed(context, Routes.groupRegister), 
        icon: Icon(Icons.add, color:AppColors.black, size: 32,)
      )
    ]
  );

  RefreshIndicator groupsList(List<GroupEntity> groups) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async => controller.getAll(),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return GroupListItem(group: groups[index]);
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: Spacing.x1);
        },
      ),
    );
  }
}



