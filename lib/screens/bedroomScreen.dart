// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables
import 'package:demo/components/constants.dart';
import 'package:demo/components/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      heightUpper = totHeight*2/5;
    });
    return Scaffold(
      body: Stack(children: [
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
                    padding: EdgeInsets.only(top: 0, left: 30, bottom: 0, right: 30),
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
        Positioned(
          top: heightUpper - 20,
          right: 40,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 4, blurRadius: 10),
              ],
            ),
            child: CircleAvatar(
              child: SvgPicture.asset("assets/images/Icon awesome-power-off.svg"),
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ]),
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
    );
  }
}

class IntensityContainer extends StatefulWidget {
  const IntensityContainer({Key key}) : super(key: key);

  @override
  _IntensityContainerState createState() => _IntensityContainerState();
}

class _IntensityContainerState extends State<IntensityContainer> {
  int lightLevel;
  @override
  void initState() {
    lightLevel = 1;
    super.initState();
  }

  getColor(int lightLevel) {
    if (lightLevel == 5) {
      return Colors.yellow.shade700;
    } else if (lightLevel >= 3) {
      return Colors.yellow.shade600;
    } else if (lightLevel >= 1) {
      return Colors.yellow.shade300;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Intensity",
          style: TextStyle(
            fontSize: 25,
            color: primaryDark,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/solution2.svg",
              height: 28,
              color: Colors.grey,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 3.5 / 5,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbColor: Color(0xFFEB1555),
                  overlayColor: Color(0x29EB1555),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
                ),
                child: Slider(
                  value: lightLevel.toDouble(),
                  activeColor: Colors.yellow.shade600,
                  autofocus: true,
                  inactiveColor: Colors.grey,
                  min: 0,
                  max: 5,
                  divisions: 5,
                  onChanged: (double newValue) {
                    setState(() {
                      lightLevel = newValue.round();
                    });
                  },
                ),
              ),
            ),
            SvgPicture.asset(
              "assets/images/solution.svg",
              height: 30,
              color: getColor(lightLevel),
            ),
          ],
        )
      ],
    );
  }
}

class ColorsContainer extends StatefulWidget {
  const ColorsContainer({Key key}) : super(key: key);

  @override
  _ColorsContainerState createState() => _ColorsContainerState();
}

class _ColorsContainerState extends State<ColorsContainer> {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Colors",
          style: TextStyle(
            fontSize: 25,
            color: primaryDark,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CircularButton(colors: Colors.redAccent.withOpacity(0.75)),
              CircularButton(colors: Colors.greenAccent.withOpacity(0.75)),
              CircularButton(colors: Colors.lightBlueAccent.withOpacity(0.75)),
              CircularButton(colors: Colors.deepPurpleAccent.withOpacity(0.75)),
              CircularButton(colors: Colors.purpleAccent.withOpacity(0.75)),
              CircularButton(colors: Colors.orangeAccent.withOpacity(0.75)),
              CircularAddButton(colors: Colors.white, path: "assets/images/+.svg")
            ],
          ),
        )
      ],
    );
  }
}

class ScenesContainer extends StatefulWidget {
  const ScenesContainer({Key key}) : super(key: key);

  @override
  _ScenesContainerState createState() => _ScenesContainerState();
}

class _ScenesContainerState extends State<ScenesContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Scenes",
          style: TextStyle(
            fontSize: 25,
            color: primaryDark,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 10),
        Column(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ScenesWidget(
                  color1: Colors.redAccent,
                  color2: Colors.redAccent.shade100,
                  text: "Birthday",
                ),
                ScenesWidget(
                  color1: Colors.purpleAccent,
                  color2: Colors.purpleAccent.shade100,
                  text: "Relax",
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ScenesWidget(
                  color1: Colors.lightBlueAccent,
                  color2: Colors.lightBlueAccent.shade100,
                  text: "Relax",
                ),
                ScenesWidget(
                  color1: Colors.lightGreenAccent,
                  color2: Colors.lightGreenAccent.shade100,
                  text: "Fun",
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
