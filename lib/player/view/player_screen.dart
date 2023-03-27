import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video/home/provider/home_provider.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).initvideo();
  }

  HomeProvider? playerProviderf;
  HomeProvider? playerProvidert;

  @override
  Widget build(BuildContext context) {
    playerProviderf = Provider.of<HomeProvider>(context, listen: false);
    playerProvidert = Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
                height: 1,
                width: 1,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.blue, blurRadius: 300, spreadRadius: 150)
                ])),
            Positioned(
                top: 200,
                left: 200,
                child: Container(
                    height: 1,
                    width: 1,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.red.withOpacity(0.50),
                          blurRadius: 300,
                          spreadRadius: 150)
                    ]))),
            Positioned(
                top: 500,
                left: 200,
                child: Container(
                    height: 1,
                    width: 1,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.blue.withOpacity(0.50),
                          blurRadius: 300,
                          spreadRadius: 150)
                    ]))),
            Positioned(
                top: 400,
                left: 10,
                child: Container(
                    height: 1,
                    width: 1,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.teal.withOpacity(0.50),
                          blurRadius: 300,
                          spreadRadius: 150)
                    ]))),
            Positioned(
                top: 700,
                left: 200,
                child: Container(
                    height: 1,
                    width: 1,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.teal.withOpacity(0.50),
                          blurRadius: 300,
                          spreadRadius: 150)
                    ]))),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.60),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black45,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 195,
                  width: double.infinity,
                  child: Chewie(
                    controller: playerProviderf!.chewieController!,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "${playerProviderf!.videoname[playerProviderf!.i]}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                InkWell(
                  onTap: () {
                    playerProvidert!.chCon();
                  },
                  child: (playerProvidert!.con)?playerProvidert!.det():playerProvidert!.det1(),
                ),
                SizedBox(height: 20,),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                      border: Border.all(color: Colors.white)
                    ),
                    child: ListView.builder(
                      itemCount: playerProviderf!.video.length,
                      itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            playerProviderf!.chi(index);
                            playerProviderf!.chewieController!.pause();
                            Navigator.pushReplacementNamed(context, 'player');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(children: [
                              Container(height: 50,width: 75,child: Image.network('${playerProviderf!.img[index]}',fit: BoxFit.cover)),
                              SizedBox(width: 10,),
                              Text(
                                "${playerProviderf!.videoname[index]}",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20),
                              )
                            ]),
                          )),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
