import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AuthPage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AuthPage is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
