import 'package:get/get.dart';
import 'package:urban_farm/app/app.dart';

class AppBindings implements Bindings {

  @override
  void dependencies() {
    Get.put(
      LocalDatabaseService(),
      permanent: true,
    );
  }
}
