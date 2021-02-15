import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shorto/components/calculate_button.dart';
import 'package:shorto/components/constants.dart';
import 'package:shorto/components/reusable_card.dart';
import 'package:shorto/screens/inputs_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var myGroup = AutoSizeGroup();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shorto Calculator',
          style: kLargeTextButton,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Welcome',
                style: kBigGuys,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: ReusableCard(
              colour: kPrimaryColor,
              cardChild: AutoSizeText(
                'You are about to make your first home-made Porto. It\'s pretty easy!'
                '\n'
                '\nAll you need to do is mix a fine grape spirit and a grape musk. '
                'As you may suggest, making of a porto is a seasonal thing. It\'s doable as long as the maturation of wine is still in process. '
                'The next calculation will be done with noting that average alcohol content of the grape must is around 7% and desired alcohol content in final product should be 19%. '
                'So prepare the measuring vessels, mixing jag and hit the start button to proceed.'
                '\n\n'
                'Oh, one last thing. We can\'t call it "Porto" since it wasn\'t done completely in the Douro Valley. '
                'I call it Shorto, but you can call it whatever you want. \n'
                '\n'
                'Enjoy!',
                group: myGroup,
                style: kInfoTextStyle,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20.0,
              ),
              child: AutoSizeText(
                'Shorty',
                group: myGroup,
                style: kInfoTextStyle,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          CalculateButton(
            buttonTitle: 'START',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InputsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
