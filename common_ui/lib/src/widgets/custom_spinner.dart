import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theme/theme.dart';

class CustomSpinner extends StatelessWidget {
  final Color? color;
  const CustomSpinner({ Key? key, this.color }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(size: 16, color: color ?? AppColors.foreground);
  }
}