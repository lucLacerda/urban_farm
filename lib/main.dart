import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_farm/app/app.dart';
import 'package:urban_farm/app/core/bindings/app_bindings.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Urban Farm',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: AuthRoutes.auth,
      initialBinding: AppBindings(),
      getPages: AppPages.routes,
    ),
  );
}
