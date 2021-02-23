import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shorto/components/autosize_widget.dart';
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
        title: AutoSizeWidget(
          text: 'Results',
          style: kLargeTextButton,
          key: Key('title'),
        ),
        leading: Container(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              // padding: EdgeInsets.all(15.0),
              // margin: EdgeInsets.only(
              //   bottom: 20.0,
              // ),
              alignment: Alignment.center,
              child: Center(
                child: AutoSizeWidget(
                  text: 'Results:',
                  style: kBigGuys,
                  key: Key('text_1'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeWidget(
                    text: 'Mix',
                    style: kResultsBlack,
                    key: Key('text_2'),
                  ),
                  AutoSizeWidget(
                    text: grappaMl + 'ml \n' + grappaPerc + '% Grappa',
                    style: kResultsWhite,
                    key: Key('text_3'),
                  ),
                  AutoSizeWidget(
                    text: 'with',
                    style: kResultsBlack,
                    key: Key('text_4'),
                  ),
                  AutoSizeWidget(
                    text: grapeMuskMl + 'ml \ngrape must',
                    style: kResultsWhite,
                    key: Key('text_5'),
                  ),
                  AutoSizeWidget(
                    text: 'to create',
                    style: kResultsBlack,
                    key: Key('text_6'),
                  ),
                  AutoSizeWidget(
                    text: shortoMl + 'ml Shorto',
                    style: kResultsWhite,
                    key: Key('text_7'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: CalculateButton(
              buttonTitle: 'RE-CALCULATE',
              onTap: () {
                Navigator.pop(context);
              },
                key: Key('calc_btn'),
            ),
          ),
        ],
      ),
    );
  }
}
