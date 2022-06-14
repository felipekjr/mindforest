
import 'package:app_groups/src/domain/entities/group_entity.dart';
import 'package:common_deps/common_deps.dart';
import 'package:core/helpers/helpers.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/repositories.dart';

class GroupDetailsController extends BaseController {
  final GroupRepository repository;
  late GroupEntity currentGroup;
  late String groupId;
  late ValueNotifier<GroupEntity> groupNotifier;

  GroupDetailsController({
    required this.repository
  });

  @override
  void init() {
    state = ValueNotifier(const UIInitialState());
    groupNotifier = ValueNotifier(GroupEntity.empty());
    getDetails();
  }

  void getDetails() async {
    try {
      state.value = const UILoadingState();
      final res = await repository.get(groupId);
      if (res != null) {
        groupNotifier.value = res;
      } else {
        state.value = const UIErrorState('Erro ao recuperar detalhes do grupo');
      }
    } catch (e) {
      state.value = const UIErrorState('Erro ao recuperar detalhes do grupo');
    }
  }

  void delete() async {
    try {
      state.value = const UILoadingState();
      final res = await repository.delete(currentGroup.id!);
      if (res) {
        state.value = const UISuccessState('Grupo removido com sucesso!');
      } else {
        state.value = const UIErrorState('Erro ao apagar grupo');
      }
    } catch (e) {
      state.value = const UIErrorState('Erro ao apagar grupo');
    }
  }

  @override
  void closeNotifiers() {
    state.dispose();
    groupNotifier.dispose();
  }
}