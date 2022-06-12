import 'package:common_ui/common_ui.dart';
import 'package:core/extensions/datetime_extension.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

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
      )
    );
  }
}