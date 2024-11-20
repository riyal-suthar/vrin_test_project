//All global will define in this file

import 'package:ticket_reselling/export.dart';

class Global {
  var isInterNetExist = 0;
  static ValueNotifier<bool> isNetworkDisabled = ValueNotifier(false);

  static Locale? locale;
}
