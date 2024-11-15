import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_farm/lib.dart';

class FarmController extends GetxController {
  FarmController(
    this.dbService,
  );

  final LocalDatabaseService dbService;

  final nameTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  final priceTextController = TextEditingController();

  final item = Item.empty().obs;

  final isEdit = false.obs;

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      isEdit(true);

      item(Item.fromMap(Get.arguments));

      if (item.value.name != '') {
        nameTextController.text = item().name;
      }

      if (item.value.description != '') {
        descriptionTextController.text = item().description;
      }

      if (item.value.price != 0.0) {
        priceTextController.text = item().price.toString().replaceAll('.', ',');
      }
    }
  }

  Future<void> saveItem() async {
    final price = priceTextController.value.text.replaceAll('.', '');

    final saveItem = Item(
      id: item().id,
      name: nameTextController.text,
      description: descriptionTextController.text,
      price: double.tryParse(price.replaceAll(',', '.')) ?? 0,
    );

    isEdit() ? await _editItem(saveItem) : await _addItem(saveItem);
  }

  Future<void> _addItem(Item item) async {
    await dbService.addItem(item);

    Get.back(result: item.toMap());
  }

  Future<void> _editItem(Item item) async {
    await dbService.updateItem(item);

    Get.back();
  }
}
