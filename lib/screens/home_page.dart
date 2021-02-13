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
              colour: Color(0xFF795548),
              cardChild: Column(
                children: [
                  Text(
                    'You are about to make your home-made Porto. \n'
                    'It\'s pretty easy! \nAll you need is a fine grape spirit and living grape musk. '
                    'As you may suggest, making of porto is seasonal as long as maturation of wine. \n'
                    'The next calculation will be done with noting that average alcohol content of the grape must is around 7% '
                    'and desired alcohol content in final product should be 19%. \n'
                    'So prepare measuring vessels, mixing jag and hit start button to proceed. \n'
                    'One last thing: We can\'t call it Porto because it wasn\'t done completely in the Douro Valley. '
                    'I mixed it with my nickname, but you can call it whatever you want. \n'
                    '\n'
                    'Enjoy!',
                    style: kInfoTextStyle,
                    textAlign: TextAlign.justify,
                  ),
                ],
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
