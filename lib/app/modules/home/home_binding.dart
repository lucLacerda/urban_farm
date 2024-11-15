import 'package:get/get.dart';
import 'package:urban_farm/lib.dart';

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
