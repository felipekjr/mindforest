import 'package:common_deps/common_deps.dart';
import 'package:common_quiz/common_quiz.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/extensions/datetime_extension.dart';
import 'package:core/widgets/base_page.dart';
import 'package:flutter/material.dart';

import '../presentation.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final controller = GetIt.instance<HistoryController>();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  void dispose() {
    controller.closeNotifiers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      title: 'Histórico de respostas',
      state: controller.state,
      onError: (String m) {},
      onSuccess: (String m) {},
      children: [
        Column(
          children: [
            const HeaderSection(title: 'Respostas'),
            const SizedBox(height: Spacing.x3),
            ValueListenableBuilder<List<QuizEntity>?>(
                valueListenable: controller.quizListNotifier,
                builder: (context, quizList, _) {
                  return quizList == null
                      ? Padding(
                          padding: const EdgeInsets.only(top: Spacing.x12),
                          child: Center(
                              child: CircularProgressIndicator(
                            color: AppColors.secondary,
                          )),
                        )
                      : quizList.isNotEmpty
                          ? buildQuizList(quizList)
                          : emptyMessage();
                })
          ],
        )
      ],
    );
  }

  RefreshIndicator buildQuizList(List<QuizEntity> quizList) {
    return RefreshIndicator(
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async => controller.getAll(),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: quizList.length,
        itemBuilder: (context, index) {
          final quiz = quizList[index];
          return ShadowedContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(quiz.creationDate.formatted(showHour: true), style: TextStyles.normal(color: AppColors.black),),
                Text(
                  quiz.value.toString(),
                  style: TextStyles.normalBold(color: controller.getValueColor(quiz.value)),
                )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: Spacing.x1);
        },
      ),
    );
  }

  Padding emptyMessage() {
    return const Padding(
      padding: EdgeInsets.only(top: Spacing.x3),
      child: Center(child: Text('Nenhum grupo encontrado')),
    );
  }
}
