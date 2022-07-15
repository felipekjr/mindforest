
import 'package:app_groups/src/core/helpers/random_generator_helper.dart';
import 'package:app_groups/src/domain/entities/group_entity.dart';
import 'package:common_deps/common_deps.dart';
import 'package:core/helpers/helpers.dart';
import 'package:flutter/material.dart';

import '../data/repositories/group_repository.dart';

class RegisterGroupController extends BaseController {
  final GroupRepository repository;
  GroupEntity groupEntity = GroupEntity.empty();
  bool isFormValid = false;

  RegisterGroupController({
    required this.repository
  });

  void setGroupEntity(GroupEntity entity) {
    groupEntity = entity;
    isFormValid = groupEntity.name.isNotEmpty;
    notifyListeners();
  }

  void saveGroup() async {
    try {
      
      state.value = const UILoadingState();
      final userId = FirebaseAuth.instance.currentUser?.uid;
      final group = groupEntity.copy(
        userId: userId,
        accessToken: RandomGeneratorHelper().getRandomString(6)
      );
      await repository.save(group);
      state.value = UISuccessState('Grupo cadastrado com sucesso!');
    } catch (e) {
      state.value = const UIErrorState('Erro ao cadastrar grupo.');
    }
  } 

  @override
  void closeNotifiers() {
    state.dispose();
  }

  @override
  void init() {
    isFormValid = false;
    state = ValueNotifier(const UIInitialState());
  }
}