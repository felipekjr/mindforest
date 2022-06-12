import 'package:flutter/material.dart';

class HealthyCounter extends StatelessWidget {
  final String total;

  const HealthyCounter({
    Key? key,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Image.asset('assets/tree_health.png', width: 20, height: 20,),
        Text(total)
      ],
    );
  }
}