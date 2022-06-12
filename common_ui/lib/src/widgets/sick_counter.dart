import 'package:flutter/material.dart';

class SickCounter extends StatelessWidget {
  final String total;

  const SickCounter({
    Key? key,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset('assets/tree_sick.png', width: 20, height: 20,),
        Text(total)
      ],
    );
  }
}