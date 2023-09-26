

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pr_3_media_boster_app/Controllers/My_Tab_controller.dart';
import 'package:pr_3_media_boster_app/Controllers/audio_Controller.dart';
import 'package:provider/provider.dart';

import '../Componets/My_Back_button.dart';


class AudioDetailsPage extends StatelessWidget {
  const AudioDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {


    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        leading: MyBackButton(),
        elevation: 0,
        backgroundColor: Color(0xff323232),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Consumer<AudioController>(
          builder: (context,pro,_) {
            return Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: h * 0.4,
                      width: w * 0.9,
                      decoration: BoxDecoration(
                       image: DecorationImage(
                         image: NetworkImage(data["images"]),
                         fit: BoxFit.cover,
                       ),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),topLeft: Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade800,
                            blurRadius: 4,
                            offset: Offset(4,4),
                          ),
                        ],
                      ),
                    ),
                    Gap(10),
                    Container(
                      child: Transform.translate(offset: Offset(-100,0),
                        child: Column(
                          children: [
                            Text(data["Names"],
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            ),
                            Text(data["artists"],
                              style: TextStyle(
                                fontSize: 13,
                            ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),


                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children:[
                    StreamBuilder(
                      stream: pro.assetsAudioPlayer.currentPosition,
                      builder: (context,snapshot){

                        if(snapshot.hasData){
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Slider(
                                  min: 0,
                                  max: pro.totalDuration,
                                  value: snapshot.data?.inSeconds.toDouble() ?? 0 ,
                                  onChanged: (val) {
                                    pro.seek(seconds: val.toInt());
                                  }
                              ),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("${snapshot.data!.inMinutes}:${snapshot.data!.inSeconds % 60}"),
                                    Text("${pro.totalDuration.toInt()~/ 60}:${pro.totalDuration.toInt() % 60}"),
                                  ],
                                ),
                              ),


                            ],
                          );

                        }
                        else {
                          return const CircularProgressIndicator();
                        }


                      }


                  ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              pro.play();
                            },
                            icon: Icon(
                                Icons.play_arrow),
                          ),
                          IconButton(
                            onPressed: () {
                              pro.pause();
                            },
                            icon: Icon(
                                Icons.pause),
                          ),
                        ],
                      ),
                    ),


                  ],
                ),

              ],
            );
          }
        ),
      ),
    );
  }
}
