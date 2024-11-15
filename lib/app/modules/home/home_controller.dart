import 'package:get/get.dart';
import 'package:urban_farm/lib.dart';

class HomeController extends SuperController {
  HomeController(
    this.dbService,
  );

  final LocalDatabaseService dbService;

  final items = <Item>[].obs;

  Future<void> addItem() async {
    final result = await Get.toNamed('/farm');
    if (result == null) {
      return;
    }
    refreshList();
  }

  void refreshList() {
    items.clear();
    getItems();
  }

  Future<void> getItems() async {
    items.addAll(await dbService.getItems());
  }

  Future<void> deleteItem(final int id) async {
    await dbService.deleteItem(id);
    items.removeWhere((item) => item.id == id);
  }

  Future<void> editItem(final Item item) async {
    await Get.toNamed('/farm', arguments: item.toMap());

    refreshList();
  }

  @override
  Future<void> onInit() async {
    super.onInit();

    getItems();
  }

  @override
  Future<void> onDetached() async {
    items.addAll(await dbService.getItems());
  }

  @override
  void onHidden() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  Future<void> onResumed() async {}
}
