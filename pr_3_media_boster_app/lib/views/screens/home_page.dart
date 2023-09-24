import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Controllers/My_Tab_controller.dart';
import '../../utils/route_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin {


  @override
  void initState() {
    MyTabController.tabController = TabController(
        length: 3,vsync:this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyTabController>(
        builder: (context,pro,_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff323232),
              elevation: 0,
              toolbarHeight: 95,
              title: Text("Media Boster",style: TextStyle(
                  color: Color(0xff00D8FF)),
              ),
              actions: [
                IconButton(
                  onPressed: () {

                  Navigator.of(context).pushNamed(MyRoutes.SettingPage);

                }, icon: Icon(
                    Icons.settings),
                  iconSize: 34,
                  color: Color(0xff00D8FF),
                ),
              ],
              bottom: TabBar(
                  controller:MyTabController.tabController,
                  onTap: (index) {
                    pro.pagecontroller(index: index);
                  },
                  indicatorColor: Colors.cyanAccent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  splashFactory: NoSplash.splashFactory,
                  indicatorPadding: EdgeInsets.all(3),
                  indicatorWeight: 3,
                  indicator: BoxDecoration(
                    color: Color(0xff00D8FF),
                    border: Border.all(
                      color: Color(0xff00D8FF),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1,1),
                        color: Colors.grey.shade500,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  tabs:
                  pro.tabs
                      .map((e) => Tab(
                    child: Text(
                      e,
                      style: TextStyle(
                        color:pro.tabIndex == 0 ? Colors.grey : Colors.black,
                        fontSize: 16,

                      ),
                    ),
                  )
                  ).toList()
              ),

            ),
            body: TabBarView(
                controller: MyTabController.tabController,
                children: pro.tabPages,

            ),
          );
        }
    );
  }
}

