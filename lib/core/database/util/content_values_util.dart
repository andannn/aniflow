extension BoolEx on bool? {
  int? toInteger() {
    if (this == null) {
      return null;
    } else {
      return this! ? 1 : 0;
    }
  }
}

extension IntEx on int? {
  bool toBoolean() {
    if (this == null) {
      return false;
    } else {
      return this! == 1;
    }
  }
}