import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/video_player_controller.dart';

class VideoPlayerView extends GetView<VideoPlayerController> {
  const VideoPlayerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VideoPlayerView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'VideoPlayerView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
