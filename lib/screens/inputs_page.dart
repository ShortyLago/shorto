import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:sentry/sentry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shorto/calculation.dart';
import 'package:shorto/components/autosize_widget.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeWidget(
          text: 'Inputs',
          style: kLargeTextButton,
          key: Key('title'),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kLightPrimaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          key: Key('back_btn'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AutoSizeWidget(
                    text: 'Grappa',
                    style: kBigGuys,
                    key: Key('text_1'),
                  ),
                  AutoSizeWidget(
                    text: 'Alcohol content',
                    style: kInfoTextStyle,
                    key: Key('text_2'),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      AutoSizeWidget(
                        text: grappaPercent.toStringAsFixed(0),
                        style: kNumberTextStyle,
                        key: Key('text_3'),
                      ),
                      AutoSizeWidget(
                        text: '%',
                        style: kInfoTextStyle,
                        key: Key('text_4'),
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
                              grappaPercent > grappaPercentMin
                                  ? grappaPercent--
                                  : grappaPercent = grappaPercentMin;
                            },
                          );
                        },
                        key: Key('btn_grappa_perc_minus'),
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
                        key: Key('btn_grappa_perc_plus'),
                      ),
                    ],
                  ),
                  Slider(
                    value: grappaPercent.toDouble(),
                    min: grappaPercentMin.toDouble(),
                    max: grappaPercetnMax.toDouble(),
                    activeColor: kBlackColor,
                    inactiveColor: kLightPrimaryColor,
                    onChanged: (double newValue) {
                      setState(
                        () {
                          grappaPercent = newValue.roundToDouble();
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
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AutoSizeWidget(
                    text: 'Shorto',
                    style: kBigGuys,
                    key: Key('text_5'),
                  ),
                  AutoSizeWidget(
                    text: 'Final amount',
                    style: kInfoTextStyle,
                    key: Key('text_6'),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      AutoSizeText(
                        shortoMl.toStringAsFixed(0),
                        style: kNumberTextStyle,
                        key: Key('text_7'),
                        maxLines: 1,
                        minFontSize: 5.0,
                        maxFontSize: 50.0,
                      ),
                      AutoSizeText(
                        'ml',
                        style: kUnitsTextStyle,
                        key: Key('text_8'),
                        maxLines: 1,
                        minFontSize: 5.0,
                        maxFontSize: 18.0,
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
                        key: Key('btn_shorto_ml_minus'),
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
                        key: Key('btn_shorto_ml_plus'),
                      ),
                    ],
                  ),
                  Slider(
                    value: shortoMl.toDouble(),
                    min: shortoMlMin.toDouble(),
                    max: shortoMlMax.toDouble(),
                    activeColor: kBlackColor,
                    inactiveColor: kLightPrimaryColor,
                    onChanged: (double newValue) {
                      setState(
                        () {
                          shortoMl = newValue.roundToDouble();
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
            onTap: () async {
              try {
                Calculation result = Calculation(
                    grappaPercent: grappaPercent.toDouble(),
                    shortoMl: shortoMl.toDouble());
                double grappaMl = result.calculateGrappaMl();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                      grappaMl: grappaMl.toStringAsFixed(0),
                      grappaPerc: grappaPercent.toStringAsFixed(0),
                      grapeMuskMl:
                          result.calculateMuskMl(grappaMl).toStringAsFixed(0),
                      shortoMl: shortoMl.toStringAsFixed(0),
                    ),
                  ),
                );
              } catch (exception, stackTrace) {
                await Sentry.captureException(
                  exception,
                  stackTrace: stackTrace,
                );
              }
            },
            key: Key('calc_btn'),
          ),
        ],
      ),
    );
  }
}
