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
      case AnswerValues.someDays: return 19;
      case AnswerValues.severalDays: return 10;
      default: return 11;
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