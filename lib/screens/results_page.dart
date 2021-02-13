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
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child: Text(
                'Results:',
                style: kBigGuys,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: ReusableCard(
              colour: kWidgetColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    grapeMuskMl + 'ml \ngrape musk',
                    style: kResultsWhite,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    ' to make ',
                    style: kResultsBlack,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    shortoMl + 'ml \nShorto',
                    style: kResultsWhite,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          CalculateButton(
            buttonTitle: 'BACK',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
