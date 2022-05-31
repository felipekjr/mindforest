import 'package:flutter/material.dart';
import './spacing.dart';
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
        icon: Icon(Icons.close, color: AppColors.foreground),
        onPressed: () => Navigator.of(context).pop(),
      ) : null, 
      actions: action != null ? [
        action!
      ] : [],
      bottom: tabBar,
      backgroundColor: AppColors.black2,
      elevation: 0,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: TextStyles.header),
      ),
    );
  }
}