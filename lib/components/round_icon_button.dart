import 'package:flutter/material.dart';

import 'constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onPress, this.key});

  final IconData icon;
  final Function onPress;
  final Key key;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: kLightPrimaryColor,
      ),
      key: key,
      onPressed: onPress,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF212121),
    );
  }
}
