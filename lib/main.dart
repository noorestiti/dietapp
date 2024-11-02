import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'step1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: VideoBackground(),
      ),
    );
  }
}

class VideoBackground extends StatefulWidget {
  const VideoBackground({super.key});

  @override
  _VideoBackgroundState createState() => _VideoBackgroundState();
}

class _VideoBackgroundState extends State<VideoBackground> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('videos/home.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _controller.value.isInitialized
            ? SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: Opacity(
                opacity: 0.6,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
        )
            : Container(),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100, left: 20),
                child: const Text(
                  "Diet Plan Weight Loss ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.red, blurRadius: 10)],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 20),
                child: const Text(
                  "Get ready to start your weight-loss journey!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(), // This pushes the button to the bottom
              Container(
                margin: const EdgeInsets.only(left: 20, bottom: 30),
                height: 60,
                width: 390,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Gender()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Get Started ',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_right_alt_sharp,
                        color: Colors.white,
                        size: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
