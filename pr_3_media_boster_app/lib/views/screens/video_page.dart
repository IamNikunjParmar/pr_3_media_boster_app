import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Controllers/video_controller.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),
      child: Consumer<VideoController>(
          builder: (context,pro,_) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AspectRatio(
                  aspectRatio: pro.videoPlayerController!.value.aspectRatio,
                  child: Chewie(
                    controller: pro.chewieController!,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: pro.videos.length,
                      itemBuilder: (ctx,index){
                        return ListTile(
                          onTap: () {
                            pro.ChangeVideo(index: index);
                          },
                          title: Text("video: ${index + 1}"),
                        );

                      }
                  ),
                ),

              ],
            );
          }
      ),
    );
  }
}
