import 'package:intl/intl.dart';

extension StringExternsions on String {
  String dateTime() {
    DateFormat formatter = DateFormat('d MMM yyyy');
    return formatter.format(DateTime.parse(this));
  }

  String convertTo12HourFormat() {
    var time = split("T").last;
    List<String> parts = time.split(":");
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    String period = (hour < 12) ? 'AM' : 'PM';
    hour = (hour > 12) ? hour - 12 : hour;
    hour = (hour == 0) ? 12 : hour;

    return '$hour:$minute $period';
  }
}
