// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables
import 'package:demo/components/bulbData.dart';
import 'package:demo/components/constants.dart';
import 'package:demo/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BedRoom extends StatefulWidget {
  const BedRoom({
    Key key,
  }) : super(key: key);

  @override
  _BedRoomState createState() => _BedRoomState();
}

class _BedRoomState extends State<BedRoom> {
  double heightUpper;
  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    double totHeight = MediaQuery.of(context).size.height - bottomPadding;
    setState(() {
      heightUpper = totHeight * 2 / 5;
    });
    return ChangeNotifierProvider<BulbColor>(
      create: (context) => BulbColor(),

      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: primary,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: heightUpper,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0, left: 20, right: 30, top: 0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                              icon: SvgPicture.asset(
                                                "assets/images/Icon ionic-md-arrow-round-back.svg",
                                                height: 25,
                                              ),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              }),
                                          Text(
                                            "Bed",
                                            style: TextStyle(
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "Room",
                                        style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      TextTransition(text: "4 lights"),
                                    ],
                                  ),
                                ),
                                LightBulb(),
                              ],
                            ),
                            SizedBox(height: 50, child: HorizontalMenu())
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: EdgeInsets.only(top: 50, left: 30, bottom: 0, right: 30),
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25.0),
                                child: IntensityContainer(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25.0),
                                child: ColorsContainer(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: ScenesContainer(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              PowerButton(height: heightUpper),

            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/bulb.svg"),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/Icon feather-home.svg"),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/images/Icon feather-settings.svg"),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
