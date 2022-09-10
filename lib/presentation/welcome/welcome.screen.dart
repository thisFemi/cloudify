import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

import 'controllers/welcome.controller.dart';

class WelcomeScreen extends GetView<WelcomeController> with WindowListener {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WelcomeScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WelcomeScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
