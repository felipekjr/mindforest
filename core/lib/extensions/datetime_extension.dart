import 'package:common_deps/common_deps.dart';

extension DateTimeExtension on DateTime {
  String formatted({bool showHour = false}) {
    final f = DateFormat(showHour ?  'dd/MM/yyyy hh:mm' : 'dd/MM/yyyy');
    return f.format(this);
  }
}