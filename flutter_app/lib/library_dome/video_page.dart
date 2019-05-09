import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoSimple extends StatefulWidget {
  @override
  _VideoSimpleState createState() => new _VideoSimpleState();
}

class _VideoSimpleState extends State<VideoSimple> with TickerProviderStateMixin {
  VideoPlayerController _controller;
  ChewieController _chewieController;

  bool _isPlaying = false;
  String url =
      'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4';

  // AnimationController controller;
  // CurvedAnimation curved;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(url)
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      ..initialize().then((_) {
        setState(() {
          // _controller.setLooping(true);
          // _controller.play();
        });
      });
      _chewieController = ChewieController(
        videoPlayerController: _controller,
        aspectRatio: 5/2,
        autoPlay: true,
        looping: true
      );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ListView(
        children: <Widget>[
          new Container(
            padding: EdgeInsets.only(bottom: 20.0),
            height: 200.0,
            child: Chewie(
              controller: _chewieController,
            )
          ),
          new Container(
            padding: EdgeInsets.only(bottom: 20.0),
            height: 200.0,
            child: _controller.value.initialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : Center(
                  child: new Text('视频加载中...')
                  // new RotationTransition(
                  //   turns:curved,
                  //   child:  new Icon(Icons.category ,color:Colors.greenAccent[400]),
                  // )
                 
                ),
          ),
          FloatingActionButton(
            child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
  }
}
