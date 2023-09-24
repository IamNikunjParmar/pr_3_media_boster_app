

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pr_3_media_boster_app/Controllers/My_Tab_controller.dart';
import 'package:pr_3_media_boster_app/Controllers/audio_Controller.dart';
import 'package:pr_3_media_boster_app/Controllers/theme_controller.dart';
import 'package:pr_3_media_boster_app/Controllers/video_controller.dart';
import 'package:pr_3_media_boster_app/utils/route_utils.dart';
import 'package:pr_3_media_boster_app/views/screens/audio_page.dart';
import 'package:pr_3_media_boster_app/views/screens/home_page.dart';
import 'package:pr_3_media_boster_app/views/screens/setting_page.dart';
import 'package:pr_3_media_boster_app/views/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main(){

  runApp(


      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>MyTabController(),
          ),
          ChangeNotifierProvider(create: (context)=>ThemeController(),
          ),

          ChangeNotifierProvider(create: (context)=>AudioController(),
          ),

          ChangeNotifierProvider(create: (context)=>VideoController(),
          ),


        ],
          child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: MyRoutes.SplashScreen,
      routes: {
        MyRoutes.home:(context)=> const HomePage(),
        MyRoutes.SplashScreen:(context)=> const SplashScreenPage(),
        MyRoutes.SettingPage:(context)=> const SettingPage(),
        MyRoutes.AudioPage:(context)=> const AudioPage(),
      },
     // themeMode: ThemeMode.dark,
      themeMode:  Provider.of<ThemeController>(context).isDark? ThemeMode.light : ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
    );
  }
}
