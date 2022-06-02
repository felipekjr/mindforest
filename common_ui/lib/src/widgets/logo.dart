import 'package:flutter/widgets.dart';
import '../theme/theme.dart';
class Logo extends StatelessWidget {
  const Logo({ Key? key }) : super(key: key);

  Shader _createShader(bounds) {
    return AppColors.logoGradient.createShader(bounds);
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset('logo.png');
  }
}