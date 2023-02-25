// Return today's date formatted like -> yyyymmdd
String todaysDateFormatted() {
  var dateTimeObject = DateTime.now();

  // Year formatted -> yyyy
  String year = dateTimeObject.year.toString();

  // Month formatted -> mm
  String month = dateTimeObject.month.toString();
  if (month.length == 1) {
    month = "0$month";
  }

  // Day formatted -> dd
  String day = dateTimeObject.day.toString();
  if (day.length == 1) {
    day = "0$day";
  }

  // Final formatting
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}

// Convert String(yyyymmdd) to DateTime object
DateTime createDateTimeObject(String yyyymmdd) {
  int yyyy = int.parse(yyyymmdd.substring(0, 4));
  int mm = int.parse(yyyymmdd.substring(4, 6));
  int dd = int.parse(yyyymmdd.substring(6, 8));

  DateTime dateTimeObject = DateTime(yyyy, mm, dd);
  return dateTimeObject;
}

// Convert given DateTime object to String yyyymmdd.
String convertDateTimeToString(DateTime dateTime) {
  // Year formatted -> yyyy
  String year = dateTime.year.toString();

  // Month formatted -> mm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = "0$month";
  }

  // Day formatted -> dd
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = "0$day";
  }

  // Final formatting
  String yyyymmdd = year + month + day;

  return yyyymmdd;
}
