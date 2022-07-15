import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CustomDialog extends StatelessWidget {
  final Widget child;

  const CustomDialog({ 
    Key? key,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.foreground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Container(
        constraints: const BoxConstraints(minHeight: 200),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Spacing.x2,
            Spacing.x3,
            Spacing.x2,
            Spacing.x1,
          ),
          child: child
        ),
      ),
    );
  }
}