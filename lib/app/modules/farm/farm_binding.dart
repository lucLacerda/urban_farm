import 'package:get/get.dart';
import 'package:urban_farm/app/app.dart';

import 'farm_controller.dart';

class FarmBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut(LocalDatabaseService.new)
      ..lazyPut<FarmController>(
        () => FarmController(
          Get.find(),
        ),
      );
  }
}
