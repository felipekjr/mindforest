import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../theme/theme.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool disabled;
  final bool loading;
  final Widget? icon;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.disabled = false,
    this.loading = false,
    this.icon
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? .4 : 1,
      child: ElevatedButton(
        onPressed: disabled || loading ? null : onTap, 
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50)
          ),
          onPrimary: AppColors.black
        ),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: AppColors.gradient,
            borderRadius: BorderRadius.circular(50)
          ),
          child: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(Spacing.x2),
              child: !loading ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ... [
                    icon!,
                    const SizedBox(width: 10,)
                  ],
                  Text(
                    title, 
                    style: TextStyles.buttonText(color: AppColors.foreground)
                  ),
                ],
              ) : SpinKitThreeBounce(size: 16, color: AppColors.foreground),
            ),
          ) 
        ),
      ),
    );
  }
}