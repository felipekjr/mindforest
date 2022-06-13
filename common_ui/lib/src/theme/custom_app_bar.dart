import 'package:flutter/material.dart';
import './text_styles.dart';
import 'app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? action;
  final double? height;
  final bool hideLeading;
  final TabBar? tabBar;
  final String title;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.tabBar,
    this.height,
    this.hideLeading = false,
    this.action,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height ?? 55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: !hideLeading ? IconButton(
        icon: Icon(Icons.arrow_back, color: AppColors.black),
        onPressed: () => Navigator.of(context).pop(),
      ) : null, 
      actions: action != null ? [
        action!
      ] : [],
      bottom: tabBar,
      backgroundColor: AppColors.foreground,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: TextStyles.normal()),
      ),
    );
  }
}