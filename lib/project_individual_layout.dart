import 'package:flutter/material.dart';
import 'widgets/video_player_screen.dart';

class ProjectIndividualLayout extends StatelessWidget {
  final int index;

  final String path;

  const ProjectIndividualLayout({super.key, required this.index, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: VideoPlayerScreen(videoPath: '',))
          ],
        ),
      ),
    );
  }
}
