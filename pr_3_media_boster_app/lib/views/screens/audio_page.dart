import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Controllers/audio_Controller.dart';


class AudioPage extends StatelessWidget {
  const AudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioController>(
        builder: (context,pro,_) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: pro.audio.length,
                        itemBuilder: (ctx,index){
                          return ListTile(
                            trailing: Padding(
                              padding: EdgeInsets.all(2),
                              child: Column(
                                children: [

                                ],
                              ),
                            ),

                              onTap: () {
                                pro.ChangAudio(index: index);

                              },
                              title: Text("Audio:${index + 1}")

                          );


                        }),
                  ),
                  // SizedBox(height: 15,),
                  // CircleAvatar(
                  //   radius: 40,
                  //   foregroundImage: AssetImage(
                  //       pro.assetsAudioPlayer.getCurrentAudioImage!.path
                  //   ),
                  // ),
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
            ),
          );
        }
    );
  }
}
