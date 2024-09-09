import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:flutter/material.dart';

class ChipsNotification extends StatefulWidget {
  Function(int index) onChipSelected;
   ChipsNotification({Key? key, required this.onChipSelected}) : super(key: key);

  @override
  _ChipsNotificationState createState() => _ChipsNotificationState();
}

class _ChipsNotificationState extends State<ChipsNotification> {
  final _chips = ["New", "History"];
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Wrap(
        spacing: 12.0,
        children:
          List<Widget>.generate(
            _chips.length,
                (int index) {
              return RawChip(
                showCheckmark: false,
                backgroundColor: _value == index ? appBlack : appWhite,
                selectedColor: appBlack,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                label: Text(_chips[index], style: TextStyle(color: _value == index ? appWhite : appBlack,),),
                selected: _value == index,
                onSelected: (bool selected) {
                  setState(() {
                    if (selected) {
                      _value = index;
                      widget.onChipSelected(_value);
                    }

                  });
                },
              );
            },
          ).toList(),
      ),
    );
  }
}
