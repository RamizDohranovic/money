import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/topup_controller.dart';

class TopupView extends GetView<TopupController> {
  const TopupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TopupView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TopupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
