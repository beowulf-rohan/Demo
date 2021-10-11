// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:demo/components/constants.dart';
import 'package:demo/components/widgets.dart';
import 'package:demo/screens/bedroomScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:demo/components/objects.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double heightUpper;
  @override
  Widget build(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).padding.bottom;
    double totHeight = MediaQuery.of(context).size.height - bottomPadding;
    setState(() {
      heightUpper = totHeight / 4;
    });

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color:primary,
          ),
          child: Column(
            children: [
              SizedBox(
                  height: heightUpper,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Control\nPanel",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 30),
                        CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage("assets/images/user.jpg")),
                      ],
                    ),
                  )),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: secondary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                    ),
                  ),
                  // height: heightLower,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(top: 40, left: 40, bottom: 10),
                        child: Text(
                          "All Rooms",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: primaryDark,
                          ),
                        ),
                      ),
                      Rooms(),
                    ],
                  ),
                ),
              )
            ],
          ),
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
    );
  }
}

class Rooms extends StatelessWidget {
  const Rooms({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          ShowRooms(),
        ],
      ),
    );
  }
}

class ShowRooms extends StatelessWidget {
  const ShowRooms({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BedRoom(),
                    ),
                  );
                },
                child: RoomWidget(
                  path: rooms[0].file_path,
                  name: rooms[0].room_name,
                  count: rooms[0].lightsCount,
                ),
              ),
              RoomWidget(
                path: rooms[1].file_path,
                name: rooms[1].room_name,
                count: rooms[1].lightsCount,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoomWidget(
                path: rooms[2].file_path,
                name: rooms[2].room_name,
                count: rooms[2].lightsCount,
              ),
              RoomWidget(
                path: rooms[3].file_path,
                name: rooms[3].room_name,
                count: rooms[3].lightsCount,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoomWidget(
                path: rooms[4].file_path,
                name: rooms[4].room_name,
                count: rooms[4].lightsCount,
              ),
              RoomWidget(
                path: rooms[5].file_path,
                name: rooms[5].room_name,
                count: rooms[5].lightsCount,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
