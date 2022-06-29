import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ErrorDialog extends StatelessWidget {
  final String message;

  const ErrorDialog({ 
    Key? key,
    required this.message
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.foreground,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      child: Container(
        constraints: const BoxConstraints(maxHeight: 200, minHeight: 200),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            Spacing.x2,
            Spacing.x3,
            Spacing.x2,
            Spacing.x1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Atenção!', style: TextStyles.sectionTitle()),
              Text(message, style: TextStyles.normalThin(), textAlign: TextAlign.center),
              TextButton(
                onPressed: () => Navigator.pop(context), 
                child: Text(
                  'Cancelar', 
                  style: TextStyles.normalBold(color: AppColors.secondary),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}