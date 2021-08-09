import 'dart:io';

import 'package:flutter/material.dart';
import 'FirstPage.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LaunchPage extends StatefulWidget {
  String bmiValue, bmiResult;
  LaunchPage({required this.bmiValue, required this.bmiResult});

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  late MediaQueryData info;
  Color color = Color(0xFFFF2AC3ED);
  double margin = 580.0;
  bool visible = false;
  bool textVisible = true;
  double opacity = 1;

  void navigate() {
    Future.delayed(Duration(milliseconds: 650), () {
      setState(() {
        opacity = 0;
        color = Color(0xFF5AD186);
      });
    });
    Future.delayed(Duration(milliseconds: 1100), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return FirstPage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    info = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Stack(
          children: [
            CustomPaint(
              painter: MyFirstPainter(color: color),
              size: Size(info.size.width, info.size.height),
              child: Container(
                margin: EdgeInsets.only(top: 120),
                width: info.size.width,
                height: info.size.height,
                child: Column(
                  children: [
                    Text(
                      "${widget.bmiValue}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 70,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "${widget.bmiResult}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: visible,
              child: CustomPaint(
                painter: MyCloudPainter(),
                size: Size(info.size.width, info.size.height),
              ),
            ),
            Column(
              children: [
                Opacity(
                  opacity: opacity,
                  child: Center(
                    child: AnimatedContainer(
                      duration: Duration(seconds: 1),
                      margin: EdgeInsets.only(top: margin),
                      child: GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              margin = 140;

                              visible = true;
                              textVisible = false;
                              navigate();
                            },
                          );
                        },
                        child: Image(
                          alignment: Alignment.center,
                          width: 200,
                          height: 200,
                          image: AssetImage("images/rocket2.png"),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: textVisible,
              child: Container(
                margin: EdgeInsets.fromLTRB(120, 500, 0, 0),
                child: DefaultTextStyle(
                  style: TextStyle(
                    fontFamily: "Hahmlet",
                    fontSize: 18,
                    color: Colors.black,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Launch The Rocket",
                        speed: Duration(milliseconds: 120),
                      ),
                    ],
                    totalRepeatCount: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyFirstPainter extends CustomPainter {
  Color color;
  MyFirstPainter({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = color
      ..strokeWidth = 5;

    var path = Path();
    path.lineTo(0, size.height / 2.8);
    path.quadraticBezierTo(size.width / 2 + 10, size.height / 2 + 10,
        size.width, size.height / 2.8);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MyCloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = Color(0xFFFFFFFF);
    var path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height / 3.05);
    // path.moveTo(0, size.height / 3);
    path.quadraticBezierTo(size.width / 3 - 50, size.height / 3 - 25,
        size.width / 3 - 30, size.height / 2 - 70);
    path.moveTo(size.width / 3 - 60, size.height / 2 - 60);

    path.quadraticBezierTo(size.width / 2.8, size.height / 3.1 + 35,
        size.width / 2.2, size.height / 2 - 30);
    path.moveTo(size.width / 2.9, size.height / 2 - 30);

    path.quadraticBezierTo(size.width / 2 + 5, size.height / 3 - 15,
        size.width / 2 + 75, size.height / 2 - 30);
    path.moveTo(size.width / 2 + 30, size.height / 2 - 30);

    path.quadraticBezierTo(size.width / 2 + 70, size.height / 3,
        size.width / 2 + 130, size.height / 3 + 140);
    path.moveTo(size.width / 2 + 55, size.height / 3 + 140);

    path.quadraticBezierTo(size.width / 2 + 80, size.height / 3,
        size.width - 40, size.height / 3 + 40);

    path.quadraticBezierTo(
        size.width - 40, size.height / 3, size.width, size.height / 3);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
