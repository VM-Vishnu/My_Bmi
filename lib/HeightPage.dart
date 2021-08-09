import 'package:bmi/launchPage.dart';

import 'package:flutter/material.dart';
import 'CalculatorPage.dart';

class HeightPage extends StatefulWidget {
  double weight;
  HeightPage({required this.weight});

  @override
  _HeightPageState createState() => _HeightPageState();
}

class _HeightPageState extends State<HeightPage> {
  int height = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFF7C8A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Image(
                height: height * 2.5,
                image: AssetImage("images/Man.png"),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "HEIGHT(CM)",
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
                    "$height",
                    style: TextStyle(
                        fontFamily: "JosefinSans",
                        fontSize: 35,
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.bold),
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      activeTrackColor: Color(0xFFFEA7AE),
                      inactiveTrackColor: Color(0xFFFEAAB4),
                      thumbColor: Color(0xFFFFFFFF),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayColor: Color(0xFFFEAAB4),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 100,
                        max: 200,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.toInt();
                          });
                        }),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    constraints: BoxConstraints(minWidth: 70, minHeight: 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Color(0xFFFEA7AE),
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
                          color: Colors.pink[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: (() {
                        CalculatorPage calculatorPage = new CalculatorPage(
                            weight: widget.weight.toDouble(),
                            height: height.toDouble());
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LaunchPage(
                            bmiValue: calculatorPage.bmiValue(),
                            bmiResult: calculatorPage.bmiResult(),
                          );
                        }));
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
