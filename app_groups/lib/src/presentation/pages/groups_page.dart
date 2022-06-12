import 'package:app_groups/src/presentation/controllers/controllers.dart';
import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:core/extensions/datetime_extension.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({ Key? key }) : super(key: key);

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Meus grupos', style: TextStyles.title()),
                    const SizedBox(width: Spacing.x1),
                    const ForestIcon(),
                  ],
                ),
                IconButton(
                  onPressed: () {}, 
                  icon: Icon(Icons.add, color:AppColors.black, size: 32,)
                )
              ]
            ),
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

  RefreshIndicator groupsList(List<GroupEntity> groups) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async => controller.getAll(),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return GroupListItem(group: groups[index]);
        },
      ),
    );
  }
}

class GroupListItem extends StatelessWidget {
  const GroupListItem({
    Key? key,
    required this.group,
  }) : super(key: key);

  final GroupEntity group;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Spacing.x2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(group.name, style: TextStyles.medium(color: AppColors.primary),),
              const SizedBox(height: Spacing.x1),
              Text('Aberto em: ${group.creationDate.formatted()}', style: TextStyles.small(color:AppColors.grey)),
            ],
          ),
          Row(
            children: [
              HealthyCounter(total: '${group.healthyParticipants().length}',),
              const SizedBox(width: Spacing.x1),
              SickCounter(total: '${group.sickParticipants().length}',),
            ],
          ),
        ],
      )
    );
  }
}

