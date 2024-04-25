import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/no_internet_controller.dart';

class NoInternetView extends GetView<NoInternetController> {
  const NoInternetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NoInternetView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NoInternetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
