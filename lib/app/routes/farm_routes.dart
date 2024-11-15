import 'package:get/get.dart';

import '../modules/farm/farm_binding.dart';
import '../modules/farm/farm_page.dart';

class FarmRoutes {
  FarmRoutes._();

  static const farm = '/farm';

  static final routes = [
    GetPage(
      name: farm,
      page: FarmPage.new,
      binding: FarmBinding(),
    ),
  ];
}
