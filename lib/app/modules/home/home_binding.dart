import 'package:get/get.dart';
import 'package:urban_farm/app/app.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(LocalDatabaseService.new)
      ..lazyPut<HomeController>(
        () => HomeController(
          Get.find(),
        ),
      );
  }
}
