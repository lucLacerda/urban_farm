import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_farm/app/app.dart';

class FarmPage extends GetView<FarmController> {
  FarmPage({super.key});

  final _moneyMask = TextInputMask(
    mask: '9+.999,99',
    placeholder: '0',
    maxPlaceHolders: 3,
    reverse: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(
            controller.isEdit() ? 'Editar' : 'Adicionar',
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Obx(
              () => Column(
                children: [
                  TextFormField(
                    controller: controller.nameTextController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: controller.descriptionTextController,
                    decoration: const InputDecoration(
                      labelText: 'Descrição',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: controller.priceTextController,
                    inputFormatters: [_moneyMask],
                    decoration: const InputDecoration(
                      prefixText: r'R$ ',
                      labelText: 'Valor',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ).build(),
            const SizedBox(height: 24),
            Container(
              margin: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: controller.saveItem,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Obx(
                  () => Text(
                    controller.isEdit() ? 'Editar' : 'Adicionar',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
