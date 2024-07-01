
import 'package:flutter/material.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';

import '../../../domain/entities/video_post.dart';

class VideoScrollabbleView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollabbleView({
    super.key,
    required this.videos
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(  //PARA EVITAR LA SOBRECARGA DE LOS VIDEOS
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context,index) { //CONSTRUCCION DE LA PANTALLA
        final VideoPost videoPost = videos[index];


        //VIDEO PLAYER + GRADIENTE

        //BOTONES
        return Stack(
          children: [
            Positioned(
                bottom: 40,
                right: 20,
                child: VideoButtons( video: videoPost )
            )
          ]
        );
      }
    );
  }
}

