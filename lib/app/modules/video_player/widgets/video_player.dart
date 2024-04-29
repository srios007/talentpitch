import 'package:flutter/material.dart';
import 'package:talentpitch/app/modules/video_player/controllers/video_player_controller.dart';
import 'package:talentpitch/app/widgets/widgets.dart';
import 'package:video_player/video_player.dart' as videoPlayer;

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({super.key, required this.controller});
  final VideoPlayerController controller;
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
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
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LoadingWidget(),
                  Text('Cargando...'),
                ],
              ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
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
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              widget.controller.favoritesController.addFavorite(
                title: widget.controller.title.value,
                urlVideo: widget.controller.urlVideo.value,
              );
            },
            child: Icon(
              Icons.favorite,
            ),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _controller.seekTo(Duration.zero);
                _controller.play();
              });
            },
            child: Icon(
              Icons.autorenew,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
