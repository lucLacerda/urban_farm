import 'package:get/get.dart';
import 'package:urban_farm/lib.dart';

class FarmController extends GetxController {
  FarmController(
    this.dbService,
  );

  final LocalDatabaseService dbService;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> addItem(Item item) async {
    await dbService.addItem(item);

    Get.back(result: item.toMap());
  }

  @override
  void onClose() {
    super.onClose();
  }
}
