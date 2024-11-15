import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_farm/app/app.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: 'Getx Example',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/auth',
      getPages: AppPages.routes,
    ),
  );
}
