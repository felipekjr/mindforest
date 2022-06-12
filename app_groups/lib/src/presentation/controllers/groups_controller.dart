
import 'package:app_groups/src/domain/entities/group_entity.dart';
import 'package:common_deps/common_deps.dart';
import 'package:core/helpers/helpers.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/repositories.dart';

class GroupsController extends BaseController {
  final GroupRepository repository;
  late ValueNotifier<List<GroupEntity>?> groupsNotifier;

  GroupsController({
    required this.repository
  }) {
    state = ValueNotifier(const UIInitialState());
    groupsNotifier = ValueNotifier(null);
  }

  void getAll() async {
    try {
      state.value = const UILoadingState();
      final userId = FirebaseAuth.instance.currentUser?.uid;
      groupsNotifier.value = await repository.getAll(userId!);
    } catch (e) {
      state.value = const UIErrorState('Erro ao recuperar grupos');
    }
  }
}