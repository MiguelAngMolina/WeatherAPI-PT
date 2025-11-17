import 'package:intl/intl.dart';

class HumanFormats {

  static String shortDate(DateTime date) {
    final format = DateFormat.yMMMEd('es');
    return format.format(date);
  }

  static String shortDateTime(DateTime date) {
    final format = DateFormat.yMMMEd('es').add_jm();
    return format.format(date);
  }
}