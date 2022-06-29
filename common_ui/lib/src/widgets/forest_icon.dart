import 'package:flutter/material.dart';

class ForestIcon extends StatelessWidget {
  final double? height;
  final double? width;

  const ForestIcon({ Key? key, this.height, this.width }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/forest.png', 
      package: 'common_ui', 
      height: height ?? 30, 
      width: width ?? 30,
      fit: BoxFit.cover,
    );
  }
}