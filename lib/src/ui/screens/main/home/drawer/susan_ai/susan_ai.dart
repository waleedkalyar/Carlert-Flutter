import 'package:carlet_flutter/generated/assets.dart';
import 'package:carlet_flutter/src/app/views/res/colors.dart';
import 'package:carlet_flutter/src/app/views/res/strings.dart';
import 'package:carlet_flutter/src/utils/extensions.dart';
import 'package:carlet_flutter/src/widgets/app_text_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SusanAIPage extends StatelessWidget {
  const SusanAIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: appGrayBackground,
        appBar: AppBar(
          surfaceTintColor: appTransparent,
          leading: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: appBlack),
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.arrow_back,
                  color: appWhite,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          centerTitle: true,
          backgroundColor: appGrayBackground,
          title: Text(
            susanAI,
            style: Theme.of(context)
                .primaryTextTheme
                .titleMedium
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: Expanded(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height -
                  56 -
                  MediaQuery.of(context).padding.top,
              color: appTransparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                        color: appWhite,
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      children: [
                        26.height,
                        Text(
                          "Hi, I am susan... Your Personal Assistant!",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .titleLarge
                              ?.copyWith(
                                  color: appBlue, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        24.height,
                        Text(
                          "You can ask me things like... Show me my moving vehicles? \nor how about show me how much i spent on fuel last month?",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .titleMedium
                              ?.copyWith(fontSize: 14, color: appBlueDark),
                        ),
                        12.height,
                        Text(
                          "Why not try... show me which vehicles were overspeeding by 130 KMPH and more yesterday?",
                          style: Theme.of(context)
                              .primaryTextTheme
                              .titleMedium
                              ?.copyWith(fontSize: 14, color: appBlueDark),
                        ),
                        8.height,
                        ColorFiltered(
                          colorFilter: const ColorFilter.mode(
                            appBlue,
                            BlendMode.color,
                          ),
                          child: MediaQuery(
                            data: MediaQuery.of(context).copyWith(
                              invertColors: true,
                            ),
                            child: Image.asset(
                              Assets.aiLoading,
                              width: double.infinity,
                              height: 275,
                            ),
                          ),
                        ),
                        16.height,
                      ],
                    ),
                  ),
                  //TODO: this container will have list of chat in future and will have condition base child e.g from intro view to chat view.
                  Container(
                    margin:
                        const EdgeInsets.only(left: 12, right: 12, bottom: 16),
                    child: Row(
                      children: [
                        Expanded(
                            child: AppTextInputField(
                          hint: "You can ask me anything...",
                          floatHint: false,
                          onUpdateInput: (newValue) {},
                        )),
                        8.width,
                        Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: appBlue,
                                borderRadius: BorderRadius.circular(12)),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  CupertinoIcons.arrow_turn_down_right,
                                  color: appWhite,
                                )))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
