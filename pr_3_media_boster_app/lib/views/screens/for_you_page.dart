import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pr_3_media_boster_app/Controllers/My_Tab_controller.dart';
import 'package:pr_3_media_boster_app/utils/route_utils.dart';
import 'package:provider/provider.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {



    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;



    return Padding(padding: EdgeInsets.all(16),
    child: Consumer<MyTabController>(
      builder: (context,pro,_) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Transform.translate(
                offset: Offset(-135,5),
                child: Text("Top Charts",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const Gap(30),
              CarouselSlider(
                items: pro.allimages
                  .map(
                      (e) => Stack(
                        children:[
                          Container(
                          //   height: 210,
                          // width: 210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade700,
                                blurRadius: 2,
                                offset: Offset(2,2),
                              ),
                            ],
                            image: DecorationImage(
                              image: NetworkImage(e),
                              fit: BoxFit.cover,

                            ),
                          ),

                ),
          ],
                      ),
                ).toList(),


                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayInterval: Duration(
                      seconds: 5,
                    ),
                    autoPlayAnimationDuration: Duration(
                      seconds: 2,
                    ),
                    enlargeCenterPage: true,
                  ),
              ),
              const Gap(25),
              Transform.translate(
                offset: Offset(-100,0),
                child: Text("Top Albums-Hindi",style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              const Gap(15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: pro.allDetailsAudio
                      .map(
                        (e) =>   GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(MyRoutes.AudioDetailsPage,
                            arguments: e);
                      },
                      child: Column(
                        children: [
                          Container(
                            height: h * 0.3,
                            width: w * 0.6,
                            alignment: Alignment.bottomLeft,
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade800,
                                    offset: Offset(2,2),
                                    blurRadius: 3
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                          boxShadow: [
                                                   BoxShadow(
                                                     color: Colors.grey.shade800,
                                                     offset: Offset(2,2),
                                                     blurRadius: 3
                                           ),
                                             ],
                                      image: DecorationImage(
                                        image: NetworkImage(e["images"]),
                                        fit: BoxFit.cover,
                                      ),
                                         ),

                                  ),
                                ),


                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                            ),
                            alignment: Alignment.topLeft,
                            child: Transform.translate(offset: Offset(-45,0),
                              child: Column(
                                children: [
                                  Text(e["Names"],
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Gap(2),
                                  Text(e["artists"],
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
                    ),
                  ).toList(),
                ),
              ),

            ],
          ),
        );
      }
    ),
    );
  }
}
