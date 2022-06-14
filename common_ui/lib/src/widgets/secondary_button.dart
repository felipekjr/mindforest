import 'package:flutter/material.dart';
import '../theme/theme.dart';

class SecondaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool disabled;
  final Color? color;

  const SecondaryButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.disabled = false,
    this.color
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.x3),
      child: ElevatedButton(
        onPressed: disabled ? null : onTap, 
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          onPrimary: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: disabled ? Colors.grey[400] : color ?? AppColors.primary,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(Spacing.x2),
              child: Text(title, style: TextStyles.buttonText(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}