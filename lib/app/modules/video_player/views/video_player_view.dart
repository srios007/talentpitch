import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talentpitch/app/modules/video_player/controllers/video_player_controller.dart';
import 'package:video_player/video_player.dart' as videoPlayer;

class VideoPlayerView extends GetView<VideoPlayerController> {
  const VideoPlayerView({super.key});
  @override
  Widget build(BuildContext context) {
    return VideoApp(controller: controller);
  }
}

class VideoApp extends StatefulWidget {
  const VideoApp({super.key, required this.controller});
  final VideoPlayerController controller;
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late videoPlayer.VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = videoPlayer.VideoPlayerController.networkUrl(
        Uri.parse(widget.controller.urlVideo.value))
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.controller.title.value),
        centerTitle: true,
      ),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: videoPlayer.VideoPlayer(_controller),
              )
            : Text('Cargando...'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
