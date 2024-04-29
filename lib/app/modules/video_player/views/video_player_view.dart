import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/modules/video_player/controllers/video_player_controller.dart';
import 'package:talentpitch/app/modules/video_player/widgets/video_player.dart';

class VideoPlayerView extends GetView<VideoPlayerController> {
  const VideoPlayerView({super.key});
  @override
  Widget build(BuildContext context) {
    return VideoPlayer(controller: controller);
  }
}

