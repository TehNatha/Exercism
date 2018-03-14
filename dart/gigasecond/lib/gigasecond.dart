class Gigasecond {
  DateTime birthDate;
  Gigasecond(this.birthDate);

  DateTime date() {
    return birthDate.add(new Duration(seconds: 1000000000));
  }
}
