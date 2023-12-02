import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void initializeTimezone() {
  tz.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('America/Lima'));
}

String getCurrentDate() {
  DateTime now = tz.TZDateTime.now(tz.local);
  return DateFormat('yyyy-MM-dd').format(now);
}

String getCurrentTime() {
  DateTime now = tz.TZDateTime.now(tz.local);
  return DateFormat('kk:mm').format(now);
}
