import 'package:flutter/material.dart';
import 'package:ticket_reselling/export.dart';

class Intro_Choose_Language_Screen extends StatefulWidget {
  const Intro_Choose_Language_Screen({super.key});

  @override
  State<Intro_Choose_Language_Screen> createState() =>
      _Intro_Choose_Language_ScreenState();
}

class _Intro_Choose_Language_ScreenState
    extends State<Intro_Choose_Language_Screen> {
  @override
  Widget build(BuildContext context) {
    var select;
    return Material(
      child: Column(
        children: [
          Text("Choose Language"),
          Card(
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return RadioMenuButton(
                      value: select,
                      groupValue: index,
                      onChanged: (val) {
                        setState(() {
                          select = val;
                        });
                        print("choose $select");
                      },
                      child: Text("English"));
                }),
          ),
          ElevatedButton(
            onPressed: () => AppRoutes.selectLanguageScreen,
            child: Text("Continue"),
          )
        ],
      ),
    );
  }
}
