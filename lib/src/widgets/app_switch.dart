import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:flutter/cupertino.dart';

class AppSwitch extends StatefulWidget {
  const AppSwitch({Key? key}) : super(key: key);

  @override
  _AppSwitchState createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      //constraints: const BoxConstraints(maxHeight: 6.0, maxWidth: 12.0),
      child: CupertinoSwitch(
          value: _value,
          activeColor: appGreen,
          onChanged: (newValue) {
            setState(() {
              _value = newValue;
            });
          }),
    );
  }
}
