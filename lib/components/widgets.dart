// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables
import 'package:demo/components/bulbData.dart';
import 'package:demo/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

String getSvg(color, opacity) {
  return '''
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="139" height="159" viewBox="0 0 139 159">
  <defs>
    <filter id="Ellipse_10" x="35" y="89" width="70" height="70" filterUnits="userSpaceOnUse">
      <feOffset dy="3" input="SourceAlpha"/>
      <feGaussianBlur stdDeviation="8" result="blur"/>
      <feFlood flood-color="#ffc72f"/>
      <feComposite operator="in" in2="blur"/>
      <feComposite in="SourceGraphic"/>
    </filter>
  </defs>
  <g id="light_bulb" data-name="light bulb" transform="translate(-204 4)">
    <g transform="matrix(1, 0, 0, 1, 204, -4)" filter="url(#Ellipse_10)">
      <circle id="Ellipse_10-2" data-name="Ellipse 10" cx="11" cy="11" r="11" transform="translate(59 110)" fill="$color" opacity="$opacity"/>
    </g>
    <path id="Path_100" data-name="Path 100" d="M30.334,1.617h79.054c3.314,0,4.206,2.324,6,6L139,62a6,6,0,0,1-6,6H6a6,6,0,0,1-6-6L24.334,7.617C25.837,4.237,27.02,1.617,30.334,1.617Z" transform="translate(204 52)" fill="#fff"/>
    <rect id="Rectangle_13" data-name="Rectangle 13" width="5" height="102" transform="translate(271 -4)" fill="#fff"/>
    <rect id="Rectangle_14" data-name="Rectangle 14" width="4" height="58" rx="2" transform="matrix(0.921, -0.391, 0.391, 0.921, 303.828, 59.087)" fill="#568bd0" opacity="0.151"/>
  </g>
</svg>
  ''';
}

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

class _TextTransitionState extends State<TextTransition> with SingleTickerProviderStateMixin {
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

    Future<void>.delayed(Duration(seconds: 0), () {
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

    Future<void>.delayed(Duration(seconds: 0), () {
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
    String opacity = Provider.of<BulbColor>(context).opacity;
    bool isOn = Provider.of<BulbColor>(context).isOn;
    if (opacity.compareTo("0.0") == 0) {
      isOn = false;
      opacity = "1.0";
    }
    String color = (isOn) ? Provider.of<BulbColor>(context).bulbColor : "#000000";

    return SlideTransition(
      position: animation,
      child: FadeTransition(
        opacity: animationController,
        child: SvgPicture.string(
            getSvg(
              color,
              opacity,
            ),
            height: 200),
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

    Future<void>.delayed(Duration(milliseconds: 1200), () {
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

class PowerButton extends StatefulWidget {
  final double height;
  const PowerButton({Key key, @required this.height}) : super(key: key);

  @override
  _PowerButtonState createState() => _PowerButtonState();
}

class _PowerButtonState extends State<PowerButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.height - 20,
      right: 40,
      child: GestureDetector(
        onTap: () {
          Provider.of<BulbColor>(context, listen: false).turnOff();
        },
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
    );
  }
}

class CircularButton extends StatelessWidget {
  final Color colors;
  const CircularButton({Key key, @required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: colors,
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

class IntensityContainer extends StatefulWidget {
  const IntensityContainer({Key key}) : super(key: key);

  @override
  _IntensityContainerState createState() => _IntensityContainerState();
}

class _IntensityContainerState extends State<IntensityContainer> {
  int lightLevel;
  @override
  void initState() {
    lightLevel = 5;
    super.initState();
  }

  getColor(int lightLevel) {
    Color color;
    if (lightLevel == 5) {
      Colors.yellow.shade700;
    } else if (lightLevel >= 3) {
      color = Colors.yellow.shade600;
    } else if (lightLevel >= 1) {
      color = Colors.yellow.shade300;
    } else {
      color = Colors.grey;
    }
    return color;
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
                    String newOpacity;
                    if (lightLevel == 5) {
                      newOpacity = "1";
                    } else if (lightLevel == 4) {
                      newOpacity = "0.8";
                    } else if (lightLevel == 3) {
                      newOpacity = "0.6";
                    } else if (lightLevel == 2) {
                      newOpacity = "0.4";
                    } else if (lightLevel == 1) {
                      newOpacity = "0.2";
                    } else {
                      newOpacity = "0.0";
                    }

                    Provider.of<BulbColor>(context, listen: false).changeOpacity(newOpacity);
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
              GestureDetector(
                onTap: () {
                  Provider.of<BulbColor>(context, listen: false).changeColor("#ff8a80");
                },
                child: CircularButton(colors: Color(0xffFF8A80)),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<BulbColor>(context, listen: false).changeColor("#b9f6ca");
                },
                child: CircularButton(colors: Color(0xffB9F6CA)),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<BulbColor>(context, listen: false).changeColor("#80d8ff");
                },
                child: CircularButton(colors: Color(0xff80D8FF)),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<BulbColor>(context, listen: false).changeColor("#b388ff");
                },
                child: CircularButton(colors: Color(0xffB388FF)),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<BulbColor>(context, listen: false).changeColor("#ea80fc");
                },
                child: CircularButton(colors: Color(0xffEA80FC)),
              ),
              GestureDetector(
                onTap: () {
                  Provider.of<BulbColor>(context, listen: false).changeColor("#ffd180");
                },
                child: CircularButton(colors: Color(0xffFFD180)),
              ),
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
