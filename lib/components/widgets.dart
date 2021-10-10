// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables
import 'package:demo/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoomWidget extends StatelessWidget {
  final String path, name;
  final int count;
  RoomWidget({Key key, @required this.path, @required this.name, @required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 160,
      width: 160,
      child: Padding(
        padding: const EdgeInsets.only(top: 25, left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(path, height: 60),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 5),
            Text(
              "$count lights",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}

class HorizontalMenuButton extends StatelessWidget {
  final bool isSelected;
  final String position;
  final SvgPicture icon;
  HorizontalMenuButton({
    Key key,
    @required this.icon,
    @required this.position,
    @required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 20,
        width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? primaryDark : Colors.white,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: icon,
            ),
            Text(
              position,
              style: TextStyle(
                color: isSelected ? Colors.white : primaryDark,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TextTransition extends StatefulWidget {
  final String text;
  const TextTransition({Key key, @required this.text}) : super(key: key);

  @override
  _TextTransitionState createState() => _TextTransitionState();
}

class _TextTransitionState extends State<TextTransition> with SingleTickerProviderStateMixin{
  Animation<Offset> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    Future<void>.delayed(Duration(seconds: 0), (){
      animationController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: FadeTransition(
        opacity: animationController,
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}

class LightBulb extends StatefulWidget {
  const LightBulb({Key key}) : super(key: key);

  @override
  _LightBulbState createState() => _LightBulbState();
}

class _LightBulbState extends State<LightBulb> with SingleTickerProviderStateMixin {
  Animation<Offset> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );

    Future<void>.delayed(Duration(seconds: 0), (){
      animationController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: FadeTransition(
        opacity: animationController,
        child: SvgPicture.asset(
          "assets/images/light bulb.svg",
          height: 220,
        ),
      ),
    );
  }
}



class HorizontalMenu extends StatefulWidget {
  const HorizontalMenu({Key key}) : super(key: key);

  @override
  State<HorizontalMenu> createState() => _HorizontalMenuState();
}

class _HorizontalMenuState extends State<HorizontalMenu> with SingleTickerProviderStateMixin {
  Animation<Offset> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween<Offset>(
      begin: Offset(1.5, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    Future<void>.delayed(Duration(milliseconds: 1200), (){
      animationController.forward();
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          HorizontalMenuButton(
            icon: SvgPicture.asset("assets/images/surface1.svg", height: 25),
            position: "Main Light",
            isSelected: false,
          ),
          HorizontalMenuButton(
            icon: SvgPicture.asset("assets/images/furniture-and-household.svg", height: 25),
            position: "Desk Light",
            isSelected: true,
          ),
          HorizontalMenuButton(
            icon: SvgPicture.asset("assets/images/bed (1).svg", height: 25),
            position: "Bed Light",
            isSelected: false,
          ),
        ],
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final Color colors;
  const CircularButton({Key key, @required this.colors}) : super(key: key);

  changeColor(Color colors) {
    print(colors);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeColor(colors);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CircleAvatar(
          radius: 16,
          backgroundColor: colors,
        ),
      ),
    );
  }
}

class CircularAddButton extends StatelessWidget {
  final Color colors;
  final String path;
  const CircularAddButton({Key key, @required this.colors, @required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CircleAvatar(
          radius: 16,
          backgroundColor: colors,
          child: SvgPicture.asset(
            path,
            height: 20,
          ),
        ),
      ),
    );
  }
}

class ScenesWidget extends StatelessWidget {
  final Color color1, color2;
  final String text;
  const ScenesWidget({
    Key key,
    @required this.color1,
    @required this.color2,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
        child: Container(
          height: 60,
          width: 150,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: <Color>[
                color1,
                color2,
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SvgPicture.asset(
                  "assets/images/surface2.svg",
                  height: 25,
                ),
              ),
              Text(
                text,
                style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
