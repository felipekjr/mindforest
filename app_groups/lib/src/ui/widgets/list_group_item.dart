import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/routes.dart';
import 'package:flutter/material.dart';

import '../../controllers/controllers.dart';
import '../../domain/entities/entities.dart';

class GroupListItem extends StatelessWidget {
  const GroupListItem({
    Key? key,
    required this.group,
  }) : super(key: key);

  final GroupEntity group;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GetIt.I<GroupDetailsController>().currentGroup = group;
        Navigator.pushNamed(context, Routes.groupDetails)
          .then((value) => GetIt.I<GroupsController>().getAll());
      },
      child: ShadowedContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(group.name, style: TextStyles.medium(color: group.isActive ? AppColors.primary : AppColors.grey),),
                const SizedBox(height: Spacing.x1),
                Text('${group.participants.length} Participantes', style: TextStyles.small(color:AppColors.grey)),
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
        ),
      ),
    );
  }
}