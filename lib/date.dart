String getServerTime() {
  DateTime time = DateTime.now();

  var datetime = DateTime.fromMillisecondsSinceEpoch((time.millisecondsSinceEpoch) + (3600000 * 5),
      isUtc: true);
  return datetime.toIso8601String();
}

String getDefaultDate() {
  var datetime = DateTime.fromMillisecondsSinceEpoch(0);
  return datetime.toIso8601String();
}

extension IsoToData on String {
  String toDate() {
    var time = DateTime.parse(this);
    return "${addZeroIfLess10(time.day)}.${addZeroIfLess10(time.month)}.${addZeroIfLess10(time.year)}";
  }

  String toDateHM() {
    var time = DateTime.parse(this);
    return "${addZeroIfLess10(time.day)}.${addZeroIfLess10(time.month)}.${addZeroIfLess10(time.year)}  ${addZeroIfLess10(time.hour)}:${addZeroIfLess10(time.minute)}:${addZeroIfLess10(time.second)}";
  }

  FromToDate dividerToServerTime() {
    var divider = this;
    var fromDate = FromToDate(from: '', to: '');
    var currentDate = DateTime.now();
    if (divider == "day") {
      fromDate = fromDate.copyWith(
          from: DateTime.utc(currentDate.year, currentDate.month, currentDate.day, 0)
              .toIso8601String());
    }
    if (divider == "week") {
      fromDate = fromDate.copyWith(
          from: currentDate
              .subtract(Duration(
                  days: currentDate.weekday - 1,
                  hours: currentDate.hour,
                  minutes: currentDate.minute,
                  seconds: currentDate.second))
              .toIso8601String());
    }
    if (divider == "month") {
      fromDate = fromDate.copyWith(
          from: DateTime.utc(currentDate.year, currentDate.month, 0).toIso8601String());
    }
    if (divider == "year") {
      fromDate = fromDate.copyWith(from: DateTime.utc(currentDate.year, 0, 0).toIso8601String());
    }
    if (divider == "quarter") {
      fromDate = fromDate.copyWith(
          from: DateTime.utc(currentDate.year, currentDate.month - 2, 0).toIso8601String());
    }
    fromDate = fromDate.copyWith(to: currentDate.toIso8601String());

    return fromDate;
  }
}

class FromToDate {
  String from;
  String to;

  FromToDate({
    required this.from,
    required this.to,
  });

  FromToDate copyWith({
    String? from,
    String? to,
  }) {
    return FromToDate(
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }

  @override
  String toString() {
    return 'FromToDate{from: $from, to: $to}';
  }
}

extension IsoToDay on String {
  String toDay() {
    var time = DateTime.parse(this);
    return "${addZeroIfLess10(time.day)}.${addZeroIfLess10(time.month)}.${addZeroIfLess10(time.year)}";
  }
}

String addZeroIfLess10(int value) {
  var newValue = value.toString();
  if (value < 10) {
    newValue = "0$value";
  }
  return newValue;
}

extension IsoToDate on String {
  DateTime toDateTime() {
    var time = DateTime.parse(this);
    return time;
  }
}

extension DateTimeToString on DateTime {
  String toUiDate() {
    return "${day.toString()}.${month.toString()}.${year.toString()} $hour:$minute";
  }
}
