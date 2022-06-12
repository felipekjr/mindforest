import 'package:flutter/material.dart';

import '../../common_ui.dart';

class HeaderSection extends StatelessWidget {
  final String title;
  const HeaderSection({
    Key? key,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(title, style: TextStyles.title()),
        const SizedBox(width: Spacing.x1),
        const ForestIcon(),
      ],
    );
  }
}