import 'package:intl/intl.dart';

class DateConverter {
  static String estimatedDate(DateTime dateTime) {
    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  static DateTime convertStringToDatetime(String dateTime) {
    return DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").parse(dateTime);
  }

  static String localDateToMonthDate(DateTime dateTime) {
    return DateFormat('MMM yyyy').format(dateTime.toLocal());
  }

  static String yearMonthDate(DateTime dateTime) {
    return DateFormat('yyyy-MM-dd').format(dateTime.toLocal());
  }

  static DateTime isoStringToLocalDate(String dateTime) {
    return DateFormat('yyyy-MM-dd').parse(dateTime, true).toLocal();
  }

  static int currentMonth(DateTime dateTime) {
    return int.parse(DateFormat('MM').format(dateTime.toLocal()));
  }

  static String monthString(DateTime dateTime) {
    return DateFormat('MMMM').format(dateTime.toLocal());
  }

  static int currentDate(DateTime dateTime) {
    return int.parse(DateFormat('dd').format(dateTime.toLocal()));
  }

  static int getTotaldayInMonth(DateTime dateTime) {
    return DateTime(dateTime.year, dateTime.month + 1, 0).day;
  }

  static int getTotaldayMonth(int year, int month) {
    return DateTime(year, month, 1).day;
  }

  static String getDayByDate(DateTime date) {
    return DateFormat('EEEE').format(date);
  }

  static DateTime getRequiredMonth(DateTime dateTime, int months) {
    print(DateFormat('EEEE')
        .format(DateTime(dateTime.year, months, dateTime.day)));
    return DateTime(dateTime.year, months, dateTime.day);
  }

  static String getdayInEng(DateTime dateTime) {
    return DateFormat('E')
        .format(DateTime(dateTime.year, dateTime.month, dateTime.day));
  }

  static int getTotalNumberOfDays(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }

  static String isoStringToLocalTimeOnly(String dateTime) {
    return DateFormat('HH:mm').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalAMPM(String dateTime) {
    return DateFormat('a').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDateOnly(String dateTime) {
    return DateFormat('dd MMM yyyy').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDayOnly(String dateTime) {
    return DateFormat('dd').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalMonthOnly(String dateTime) {
    return DateFormat('MMM').format(isoStringToLocalDate(dateTime));
  }

  static String isoStringToLocalDayNameOnly(String dateTime) {
    return DateFormat('E').format(isoStringToLocalDate(dateTime));
  }

  static String localDateToIsoString(DateTime dateTime) {
    return DateFormat('yyyy-MM-ddTHH:mm:ss.SSS').format(dateTime.toUtc());
  }

  static String localDateOnlyInNumbers(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime.toUtc());
  }

  static String requiredDateFormate(DateTime date) {
    return DateFormat('y-M-d').format(date);
  }
}
