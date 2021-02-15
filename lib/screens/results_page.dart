import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shorto/components/calculate_button.dart';
import 'package:shorto/components/constants.dart';
import 'package:shorto/components/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.grappaMl,
      @required this.grappaPerc,
      @required this.grapeMuskMl,
      @required this.shortoMl});

  final String grappaMl;
  final String grappaPerc;
  final String grapeMuskMl;
  final String shortoMl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shorto Calculator',
          style: kLargeTextButton,
        ),
        leading: Container(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              // margin: EdgeInsets.only(
              //   bottom: 20.0,
              // ),
              alignment: Alignment.center,
              child: Center(
                child: Text(
                  'Results:',
                  style: kBigGuys,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kPrimaryColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Mix ',
                    style: kResultsBlack,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    grappaMl + 'ml \n' + grappaPerc + '% Grappa',
                    style: kResultsWhite,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    ' with ',
                    style: kResultsBlack,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    grapeMuskMl + 'ml \ngrape must',
                    style: kResultsWhite,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    ' to create ',
                    style: kResultsBlack,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    shortoMl + 'ml \nShorto',
                    style: kResultsWhite,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
          CalculateButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
