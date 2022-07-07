import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/widgets/base_page.dart';
import 'package:flutter/material.dart';

import '../presentation.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({ Key? key }) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final controller = GetIt.instance<HistoryController>();

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      title: 'Respostas',
      state: controller.state, 
      onError: (String m) {  }, 
      onSuccess: (String m) {  }, 
      children: [
        Column(
          children: [
              const HeaderSection(title: 'Respostas'),
              ValueListenableBuilder<List<QuizEntity>?>(
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
        )
      ],

    );
  }
}