
import 'package:app_groups/src/domain/entities/group_entity.dart';
import 'package:common_deps/common_deps.dart';
import 'package:common_quiz/common_quiz.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../data/repositories/group_repository.dart';

class GroupsController extends BaseController {
  final GroupRepository repository;
  final GetQuizByGroup getQuizByGroup;
  late ValueNotifier<List<GroupEntity>?> groupsNotifier;

  GroupsController({
    required this.repository,
    required this.getQuizByGroup
  });

  @override
  void init() {
    state = ValueNotifier(const UIInitialState());
    groupsNotifier = ValueNotifier(null);
    getAll();
  }

  void getAll() async {
    try {
      state.value = const UILoadingState();
      final userId = FirebaseAuth.instance.currentUser?.uid;
      final list = await repository.getAll(userId!);
      groupsNotifier.value = await _getQuizFromGroups(list);
    } catch (e) {
      state.value = const UIErrorState('Erro ao recuperar grupos');
    }
  }

  Future<List<GroupEntity>> _getQuizFromGroups(List<GroupEntity> list) async {
    final newList = <GroupEntity>[];
    await Future.forEach(list, (GroupEntity element) async {
      final quizList = await getQuizByGroup.call(params: makeGetQuizByGroupParams(element.id!));
      newList.add(element.copy(participants: quizList));
    });
    return newList;
  }

  @override
  void closeNotifiers() {
    state.dispose();
    groupsNotifier.dispose();
  }
}