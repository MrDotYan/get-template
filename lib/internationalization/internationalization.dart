import 'package:get/get.dart';

import './en_US.dart';
import './zh_CN.dart';

class Internationalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys =>
      {'zh_CN': chinese, 'en_US': english};
}
