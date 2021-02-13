import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shorto/calculation.dart';
import 'package:shorto/components/calculate_button.dart';
import 'package:shorto/components/constants.dart';
import 'package:shorto/components/reusable_card.dart';
import 'package:shorto/components/round_icon_button.dart';
import 'package:shorto/screens/results_page.dart';

class InputsPage extends StatefulWidget {
  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  int grappaPercent = 40;
  int shortoMl = 700;

  int grappaPercentMin = 30;
  int grappaPercetnMax = 70;
  int shortoMlMin = 100;
  int shortoMlMax = 1500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shorto Calculator',
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ReusableCard(
              colour: kWidgetColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Grappa',
                    style: kBigGuys,
                  ),
                  Text(
                    '[Alcohol contained in grappa]',
                    style: kInfoTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        grappaPercent.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        '%',
                        style: kUnitsTextStyle,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPress: () {
                          setState(
                            () {
                              grappaPercent > grappaPercentMin
                                  ? grappaPercent--
                                  : grappaPercent = grappaPercentMin;
                            },
                          );
                        },
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPress: () {
                          setState(
                            () {
                              grappaPercent < grappaPercetnMax
                                  ? grappaPercent++
                                  : grappaPercent = grappaPercetnMax;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Slider(
                    value: grappaPercent.toDouble(),
                    min: grappaPercentMin.toDouble(),
                    max: grappaPercetnMax.toDouble(),
                    activeColor: Color(0xFF212121),
                    inactiveColor: Color(0xFFFFFFFF),
                    onChanged: (double newValue) {
                      setState(
                        () {
                          grappaPercent = newValue.round();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kWidgetColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Shorto',
                    style: kBigGuys,
                  ),
                  Text(
                    '[Final amount]',
                    style: kInfoTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        shortoMl.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'ml',
                        style: kUnitsTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPress: () {
                          setState(
                            () {
                              shortoMl > shortoMlMin
                                  ? shortoMl--
                                  : shortoMl = shortoMlMin;
                            },
                          );
                        },
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPress: () {
                          setState(
                            () {
                              shortoMl < shortoMlMax
                                  ? shortoMl++
                                  : shortoMl = shortoMlMax;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Slider(
                    value: shortoMl.toDouble(),
                    min: shortoMlMin.toDouble(),
                    max: shortoMlMax.toDouble(),
                    activeColor: Color(0xFF212121),
                    inactiveColor: Color(0xFFFFFFFF),
                    onChanged: (double newValue) {
                      setState(
                        () {
                          shortoMl = newValue.round();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          CalculateButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              Calculation result = Calculation(
                  grappaPercent: grappaPercent.toDouble(),
                  shortoMl: shortoMl.toDouble());
              double grappaMl = result.calculateGrappaMl();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    grappaMl: grappaMl.toStringAsFixed(0),
                    grappaPerc: grappaPercent.toString(),
                    grapeMuskMl:
                        result.calculateMuskMl(grappaMl).toStringAsFixed(0),
                    shortoMl: shortoMl.toString(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
