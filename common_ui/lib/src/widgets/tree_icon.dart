import 'package:flutter/material.dart';

class TreeIcon extends StatelessWidget {
  const TreeIcon({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('tree.png', package: 'common_ui', height: 30, width: 30);
  }
}