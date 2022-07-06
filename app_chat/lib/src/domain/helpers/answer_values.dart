enum AnswerValues {
  never,
  someDays,
  severalDays,
  almostEveryday
}

extension AnswerValuesExt on AnswerValues {
  int asInt() {
    switch (this) {
      case AnswerValues.never: return 0;
      case AnswerValues.someDays: return 1;
      case AnswerValues.severalDays: return 2;
      default: return 3;
    }
  }

  String asString() {
    switch (this) {
      case AnswerValues.never: return 'Nunca';
      case AnswerValues.someDays: return 'Em alguns dias';
      case AnswerValues.severalDays: return 'Em vários dias';
      default: return 'Quase sempre';
    }
  }
}