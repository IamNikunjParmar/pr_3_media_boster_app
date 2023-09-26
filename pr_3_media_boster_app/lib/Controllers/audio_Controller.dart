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

  List SongsImages = [
    "https://c.saavncdn.com/971/Badhaai-Do-Hindi-2022-20220212235808-500x500.jpg",
    "https://c.saavncdn.com/044/Deva-Deva-From-Brahmastra-Hindi-2022-20220812225424-500x500.jpg",
    "https://c.saavncdn.com/022/Heeriye-feat-Arijit-Singh-Hindi-2023-20230605195039-500x500.jpg",
    "https://c.saavncdn.com/015/Love-Ni-Bhavai-Gujarati-2017-500x500.jpg",
    "https://c.saavncdn.com/862/Love-Aaj-Kal-Hindi-2020-20200214140423-500x500.jpg",
    "https://c.saavncdn.com/018/Halka-Halka-Unplugged-Hindi-2018-20180816-500x500.jpg",
    "https://c.saavncdn.com/191/Kesariya-From-Brahmastra-Hindi-2022-20220717092820-500x500.jpg",
    "https://c.saavncdn.com/015/Love-Ni-Bhavai-Gujarati-2017-500x500.jpg",
    "https://c.saavncdn.com/903/Tu-Jhoothi-Main-Makkaar-Hindi-2023-20230316165419-500x500.jpg",
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