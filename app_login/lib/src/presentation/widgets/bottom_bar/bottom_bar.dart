import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int? index;
  const BottomBar({
    Key? key,
    this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: AppColors.black,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.currentLine,
        selectedLabelStyle: TextStyles.small(),
        currentIndex: index ?? 0,
        iconSize: 20,
        onTap: (int index) {
          if (index == 0) {
            Navigator.pushReplacementNamed(context, '/bills');
          } else {
            Navigator.pushReplacementNamed(context, '/bills/status');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: iconContainer(Icons.money_off),
            label: 'Despesas',
          ),
          BottomNavigationBarItem(
            icon: iconContainer(Icons.donut_large),
            label: 'Status',
          ),
        ]
      ),
    );
  }

  Widget iconContainer(IconData icon) => Container(
    margin: const EdgeInsets.only(bottom: Spacing.half),
    child: Icon(icon, size: 24,)
  );
}