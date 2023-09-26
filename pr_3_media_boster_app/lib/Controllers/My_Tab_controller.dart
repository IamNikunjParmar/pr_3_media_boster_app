import 'package:flutter/material.dart';
import 'package:pr_3_media_boster_app/views/screens/audio_page.dart';
import 'package:pr_3_media_boster_app/views/screens/video_page.dart';

import '../views/screens/for_you_page.dart';

class MyTabController extends ChangeNotifier {

  static TabController? tabController ;

  PageController pageController = PageController();


  pagecontroller({required int index}){

    pageController.animateToPage(
        index,
        duration: Duration(
          microseconds: 600,
        ),
        curve: Curves.easeInOut
    );
    notifyListeners();
  }

  List tabs = ["Home","Audio","video"];


  List allDetailsAudio = [

    {
      "Names":"Kesariya Tera",
      "images": "https://c.saavncdn.com/191/Kesariya-From-Brahmastra-Hindi-2022-20220717092820-500x500.jpg",
      "audios":"assets/audio/Kesariya .mp3",
      "artists":"Pritam,Arjit singh,",

    },
    {
      "Names":"Deva Deva",
      "images": "https://c.saavncdn.com/044/Deva-Deva-From-Brahmastra-Hindi-2022-20220812225424-500x500.jpg",
      "audios":"assets/audio/Deva Deva.mp3",
      "artists":"Pritam,Arjit singh",

    },
    {
      "Names":"Dil Jhoom",
      "images": "https://c.saavncdn.com/609/Gadar-2-Hindi-2023-20230912105532-500x500.jpg",
      "audios":"assets/audio/Kesariya .mp3",
      "artists":"Mithoon,Arjit singh",

    },
    {
      "Names":"Apna Bana Le",
      "images": "https://c.saavncdn.com/222/Bhediya-Hindi-2022-20230616085155-500x500.jpg",
      "artists":"Arjit singh,Sachin-jigar",

    },
    {
      "Names":"Chaleya",
      "images": "https://c.saavncdn.com/026/Chaleya-From-Jawan-Hindi-2023-20230814014337-500x500.jpg",
      "artists":"Anirudh,Arjit singh",

    },
    {
      "Names":"Raataan Lambiyan",
      "images": "https://c.saavncdn.com/238/Shershaah-Original-Motion-Picture-Soundtrack--Hindi-2021-20210815181610-500x500.jpg",
      "artists":"jubin Notiyal",

    },
    {
      "Names":"Namo Namo",
      "images": "https://c.saavncdn.com/367/Kedarnath-Hindi-2019-20190219-500x500.jpg",
      "artists":"Arjit singh",

    },

  ];



  List allimages = [
    "https://media.istockphoto.com/id/1253945862/vector/sale2.jpg?s=612x612&w=0&k=20&c=VTvCdHZZXQJjtMKvAMU0x7bdoQAhnIYkvFft4Af2aUM=",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSISUodUwmJdbgBMGImbpsiK7jSWtgu1JuRjYA6aidqTXd6mrYIkow5JNQmbQDGo-zmGAk&usqp=CAU",
    "https://tabsnation.com/wp-content/uploads/2023/05/maxresdefault-8.webp",
    "https://a10.gaanacdn.com/images/radiotheme/78/178/crop_480x480_178.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcFYCqyIiw1uX_qUKSqKenZM5KzWGJ8uwB2A&usqp=CAU",
    "https://i.ytimg.com/vi/fwbFdo0adHQ/hqdefault.jpg?days_since_epoch=19605",
  ];



  List<Widget>tabPages = [HomePages(),AudioPage(),VideoPage()];

  get tabIndex{

    tabController?.index ?? 0 ;
  }






}