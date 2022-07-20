
import 'package:app_groups/src/domain/entities/group_entity.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../data/repositories/group_repository.dart';

class GroupDetailsController extends BaseController {
  final GroupRepository repository;
  late GroupEntity currentGroup;
  late String groupId;
  late ValueNotifier<GroupEntity> groupNotifier;
  late bool isEditing;

  GroupDetailsController({
    required this.repository
  });

  void setIsEditing(bool isEditing) {
    this.isEditing = isEditing;
    notifyListeners();
  }

  void setGroup(GroupEntity group) {
    currentGroup = group;
    notifyListeners();
  }

  @override
  void init() {
    isEditing = false;
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

  void saveChanges() async {
    try {
      final res = await repository.update(currentGroup);
      if (res) {
        setIsEditing(false);
        state.value = UISuccessState('Grupo editado com sucesso!', shouldNavigate: false);
      } else {
        state.value = const UIErrorState('Erro ao editar informações do grupo');
      }
    } catch (e) {
      state.value = const UIErrorState('Erro ao editar informações do grupo');
    }
  }

  void delete() async {
    try {
      state.value = const UILoadingState();
      final res = await repository.delete(currentGroup.id!);
      if (res) {
        state.value = UISuccessState('Grupo ${currentGroup.name} removido com sucesso!');
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