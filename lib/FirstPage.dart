import 'package:flutter/material.dart';
import 'HeightPage.dart';
import 'package:page_transition/page_transition.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late MediaQueryData kInfo;
  double firstMargin = 500;
  double secondMargin = 500;
  int weight = 50;
  bool secondBoxVisible = false;
  bool firstBoxVisible = false;

  @override
  Widget build(BuildContext context) {
    kInfo = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Color(0xFF5AD186),
      body: Container(
        child: Stack(
          children: [
            CustomPaint(
              painter: MyFirstRRectanglePainter(),
              size: Size(kInfo.size.width, kInfo.size.height),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              margin: EdgeInsets.only(bottom: secondMargin),
              child: Visibility(
                visible: secondBoxVisible,
                child: CustomPaint(
                  painter: MySecondRRectanglePainter(),
                  size: Size(kInfo.size.width, kInfo.size.height),
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              margin: EdgeInsets.only(bottom: firstMargin),
              child: Visibility(
                visible: firstBoxVisible,
                child: CustomPaint(
                  painter: MyThirdRRectanglePainter(),
                  size: Size(kInfo.size.width, kInfo.size.height),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 150),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "WEIGHT(KG)",
                    style: TextStyle(
                      fontFamily: "JosefinSans",
                      fontSize: 30,
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "$weight",
                    style: TextStyle(
                        fontFamily: "JosefinSans",
                        fontSize: 35,
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold),
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Color(0xFFC1ECCB),
                      inactiveTrackColor: Color(0xFF92DDAA),
                      thumbColor: Color(0xFFFFFFFF),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayColor: Color(0xFF94DDAA),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                        value: weight.toDouble(),
                        min: 40,
                        max: 100,
                        onChanged: (double newValue) {
                          setState(() {
                            weight = newValue.toInt();
                            if (weight > 60) {
                              secondBoxVisible = true;
                              secondMargin = 40;
                            }
                            if (weight > 80) {
                              firstBoxVisible = true;
                              firstMargin = 100;
                            }
                            if (weight < 60) {
                              secondBoxVisible = false;
                              secondMargin = 500;
                            }
                            if (weight < 80) {
                              firstBoxVisible = false;
                              firstMargin = 500;
                            }
                          });
                        }),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 770),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    constraints: BoxConstraints(minWidth: 70, minHeight: 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Color(0xFFC1ECCB),
                    onPressed: (() {
                      Navigator.pop(context);
                    }),
                    child: Icon(Icons.arrow_back),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  RawMaterialButton(
                      constraints: BoxConstraints(minHeight: 45, minWidth: 190),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Colors.white,
                      child: Text(
                        "Next",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: (() {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: HeightPage(
                                  weight: weight.toDouble(),
                                )));
                      })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyFirstRRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;

    Rect rect = Offset(100, size.height / 2 - 30) & Size(180, 140);

    canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(10)), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MySecondRRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;

    Rect rect2 = Offset(100, size.height / 3 + 15) & Size(130, 100);

    canvas.drawRRect(
        RRect.fromRectAndRadius(rect2, Radius.circular(10)), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class MyThirdRRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;

    // TODO: implement paint
    Rect rect3 = Offset(160, size.height / 4 + 15) & Size(90, 70);
    canvas.drawRRect(
        RRect.fromRectAndRadius(rect3, Radius.circular(10)), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
