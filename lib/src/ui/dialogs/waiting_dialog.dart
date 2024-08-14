import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:flutter/material.dart';

class WaitingDialog extends StatelessWidget {
  final String status;

  const WaitingDialog({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: appWhite,
      surfaceTintColor: appWhite,
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 3.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                backgroundColor: appGrayLight,
                color: appGreen,
                strokeWidth: 2.5,
                strokeCap: StrokeCap.round,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
            6.width,
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(status,
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodyMedium
                        ?.copyWith(color: appGreen, fontSize: 16)),
                const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
                Text('Please wait...',
                    textAlign: TextAlign.start,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .bodySmall
                        ?.copyWith(fontSize: 11, color: appBlack)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
