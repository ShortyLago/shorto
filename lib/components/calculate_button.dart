import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shorto/components/constants.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({@required this.buttonTitle, @required this.onTap, this.key});

  final String buttonTitle;
  final Function onTap;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: FittedBox(
            child: AutoSizeText(
              buttonTitle,
              style: kLargeTextButton,
              maxFontSize: kLargeTextButton.fontSize,
            ),
          ),
        ),
        color: kDarkPrimaryColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
      key: key,
    );
  }
}
