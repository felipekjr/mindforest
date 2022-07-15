import 'dart:math';

class RandomGeneratorHelper {
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final _random = Random();

  String getRandomString(int length) {
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_random.nextInt(_chars.length))
    ));
  }
}
