import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class AudioController extends ChangeNotifier {

  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

  double totalDuration = 0;

  List audio = [
    "Atak Gaya.mp3",
    "Deva Deva.mp3",
    "Dhoop mein.mp3",
    "Dhun Laagi.mp3",
    "Haan Tum Ho.mp3",
    "Halka Halka .mp3",
    "Kesariya .mp3",
    "Vhalam Aavo.mp3",
    "Jaadui.mp3",
  ];

  ChangAudio({required int index}){

    assetsAudioPlayer.pause();
    assetsAudioPlayer.open(
      Audio("assets/audio/${audio[index]}",


      ),


      showNotification: true,

    ).then((value) {

      totalDuration = assetsAudioPlayer.current.value!.audio.duration.inSeconds.toDouble();

      notifyListeners();
    });


  }





  AudioController() {
    assetsAudioPlayer.open(
      Audio("assets/audio/${audio[0]}",
        metas: Metas(
          image:  MetasImage(
            path: "assets/images/Deva Deva.jpg",
            type: ImageType.asset,
          ),
          title: "assets/audio/${audio[0]}",



        ),
      ),

      autoStart: false,
      showNotification: true,

    ).then((value) {

      totalDuration = assetsAudioPlayer.current.value!.audio.duration.inSeconds.toDouble();

    });
  }

  play(){
    assetsAudioPlayer.play();
    notifyListeners();
  }

  pause(){
    assetsAudioPlayer.pause();
    notifyListeners();
  }


  seek({required int seconds}){

    assetsAudioPlayer.seek(

        Duration(
            seconds: seconds
        )
    );
    notifyListeners();
  }



}