import 'package:flutter/material.dart';

class ForestIcon extends StatelessWidget {
  const ForestIcon({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/forest.png', package: 'common_ui', height: 30, width: 30);
  }
}