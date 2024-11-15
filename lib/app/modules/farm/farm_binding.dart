import 'package:get/get.dart';

import 'farm_controller.dart';

class FarmBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FarmController>(
      () => FarmController(),
    );
  }
}
