import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video/home/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderf;
  HomeProvider? homeProvidert;

  @override
  Widget build(BuildContext context) {
    homeProviderf = Provider.of<HomeProvider>(context, listen: false);
    homeProvidert = Provider.of<HomeProvider>(context, listen: true);
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 20,top: 20),
                    child: Container(
                      height: 200,
                      child: CarouselSlider(
                        items: [
                          InkWell(
                            onTap: () {
                              homeProviderf!.chi(1);
                              Navigator.pushNamed(context, 'player');
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 150,
                                width: 275,
                                color: Colors.red,
                                child: Image.network("${homeProviderf!.img[1]}",
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              homeProviderf!.chi(8);
                              Navigator.pushNamed(context, 'player');
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 150,
                                width: 275,
                                color: Colors.red,
                                child: Image.network("${homeProviderf!.img[8]}",
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              homeProviderf!.chi(4);
                              Navigator.pushNamed(context, 'player');
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 150,
                                width: 275,
                                color: Colors.red,
                                child: Image.network("${homeProviderf!.img[4]}",
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                            aspectRatio: 1.7,
                            autoPlayAnimationDuration: Duration(seconds: 5),
                            enlargeCenterPage: true,
                            autoPlay: true
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 20, left: 10),
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              topLeft: Radius.circular(25)),
                          border: Border.all(color: Colors.white)),
                      child: ListView.builder(
                        itemCount: homeProviderf!.video.length,
                        itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              homeProviderf!.chi(index);
                              Navigator.pushNamed(context, 'player');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(children: [
                                Container(
                                    height: 50,
                                    width: 75,
                                    child: Image.network(
                                        '${homeProviderf!.img[index]}',
                                        fit: BoxFit.cover)),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${homeProviderf!.videoname[index]}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )
                              ]),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
