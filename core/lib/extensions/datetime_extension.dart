import 'package:common_deps/common_deps.dart';

extension DateTimeExtension on DateTime {
  String formatted() {
    final f = DateFormat('dd/MM/yyyy');
    return f.format(this);
  }
}