import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'farm_controller.dart';

class FarmPage extends GetView<FarmController> {
  const FarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FarmPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FarmPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
