import 'package:intl/intl.dart';

class Util {
  static String appId = "97ad468f1893aa35c7cb6d4f4cbed0bd";
  static String getFormattedDate(DateTime dateTime) {
    return new DateFormat("EEEE,MMM d,y ").format(dateTime);
  }
}
