import 'package:flutter/material.dart';
import '../theme/theme.dart';

class ErrorOverlay extends StatelessWidget {
  final FlutterErrorDetails details;

  const ErrorOverlay({ Key? key, required this.details }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: AppColors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                details.exception.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )
          ])
        ),
      ),
    );
  }
}