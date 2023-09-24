import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoController extends ChangeNotifier {

  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;


  List videos = [

    "v1.mp4",
    "v2.mp4",
    "v3.mp4",
    "v4.mp4",
    "v5.mp4",
    "v6.mp4",
    "v7.mp4",

  ];


  VideoController(){

    videoPlayerController = VideoPlayerController.asset("assets/video/${videos[0]}",
      videoPlayerOptions: VideoPlayerOptions(),

    )..initialize().then((value) {
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        aspectRatio: videoPlayerController!.value.aspectRatio,
        autoPlay: false,
      );
      notifyListeners();

    });

  }


  ChangeVideo({required int index}){

    videoPlayerController!.pause();
    videoPlayerController = VideoPlayerController.asset("assets/video/${videos[index]}",
    )..initialize().then((value) {

      chewieController = ChewieController(
        videoPlayerController: videoPlayerController!,
        aspectRatio: videoPlayerController!.value.aspectRatio,
        autoPlay: false,
      );
      notifyListeners();
    });

  }

  play(){
    videoPlayerController!.play();
    notifyListeners();
  }

  pause(){
    videoPlayerController!.pause();
    notifyListeners();
  }


}