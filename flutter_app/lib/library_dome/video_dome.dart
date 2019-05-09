import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;
  bool _isPlaying = false;
  String url = 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4';

  @override
  void initState() {
    super.initState();
    print('33333333333333333333');
    _controller = VideoPlayerController.network(this.url)
      // 播放状态
      ..addListener(() {
        final bool isPlaying = _controller.value.isPlaying;
        if (isPlaying != _isPlaying) {
          setState(() {
            _isPlaying = isPlaying;
          });
        }
      })
      // 在初始化完成后必须更新界面
      ..initialize().then((_) {
        print('111111111111111');
        print(_controller.value);
          print('111111111111111');
        setState(() {
          _controller.setLooping(true);
          _controller.play();
        });
      });
      print(_controller.value);
       print('33333333333333333333');
       
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: new Scaffold(
        body: new Center(
          // child: _controller.value.initialized
          //     // 加载成功
          //     ? new AspectRatio(
          //         aspectRatio: _controller.value.aspectRatio,
          //         child: VideoPlayer(_controller),
          //       )
          //     : new Container(
          //       child: new Text('视频初始状态${_controller.value.initialized} '),
          //     ),
          child: new AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
      
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _controller.value.isPlaying
              ? _controller.pause
              : _controller.play,
          child: new Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }
}
