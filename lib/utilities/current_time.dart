import 'constants.dart';

String getCurrentDateTime() {
  DateTime now = DateTime.now();
  return '${getCorrespondingMonth(now.month)} ${now.day}';
}

String getCorrespondingMonth(int month) {
  return monthsList[month];
}
