import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../controllers/controllers.dart';
import '../../domain/entities/entities.dart';
import '../widgets/widgets.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({ Key? key }) : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> with RouteAware {
  final GroupsController controller = GetIt.instance<GroupsController>();

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  void dispose() {
    super.dispose();
    controller.closeNotifiers();
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
                  ? Padding(
                      padding: const EdgeInsets.only(top: Spacing.x12),
                      child: Center(
                        child: CircularProgressIndicator(color: AppColors.secondary,)
                      ),
                    )
                  : groups.isNotEmpty
                    ? groupsList(groups)
                    : emptyMessage();
              }
            )
          ],
        ),
      ],
    );
  }

  Padding emptyMessage() {
    return const Padding(
      padding: EdgeInsets.only(top: Spacing.x3),
      child: Center(child: Text('Nenhum grupo encontrado')),
    );
  }

  Widget topSection() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const HeaderSection(title: 'Meus grupos'),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.groupRegister)
            .then((value) => controller.getAll());
        }, 
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



