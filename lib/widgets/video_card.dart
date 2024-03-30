import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.title, required this.url});
  final String title;
  final String url;

  YoutubePlayerController get _controller {
    return YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          // Text(title, textAlign: TextAlign.start, style: Theme.of(context).textTheme.titleLarge,),
          const SizedBox(
            height: 8,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
                decoration: const BoxDecoration(color: Colors.black),
                child: YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      bufferIndicator: const Icon(Icons.play_arrow),
                      controller: _controller,
                    ),
                    builder: (context, player) {
                      return Column(
                        children: [
                          player,
                        ],
                      );
                    })),
          ),
        ],
      ),
    );
  }
}
