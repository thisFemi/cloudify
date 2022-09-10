import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/register.controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RegisterScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
