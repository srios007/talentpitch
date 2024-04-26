import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/modules/profile/controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfileView'),
        centerTitle: true,
      ),
      body:   Center(
        child: GestureDetector(
          onTap: () {},
          child: Text(
            'ProfileView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
