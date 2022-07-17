enum AnswerValues {
  never,
  someDays,
  severalDays,
  almostEveryday
}

extension AnswerValuesExt on AnswerValues {
  int asInt() {
    switch (this) {
      case AnswerValues.never: return 11;
      case AnswerValues.someDays: return 8;
      case AnswerValues.severalDays: return 5;
      default: return 0;
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