import 'package:flutter/material.dart';
import 'package:ticket_reselling/location_check/check_loc.dart';

class Location_Check_Screen extends StatelessWidget {
  const Location_Check_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder(
            future: CheckLoc.checkLoc(),
            initialData: false,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // if(snapshot == null) return Text("data");
                return Center(
                  child: Text(
                      snapshot.data! ? "location Granted" : "Give Permission"),
                );
              }
              return Center(child: Text("data"));
            },
          ),
        ],
      ),
    );
  }
}
