import 'package:flutter/material.dart';
import 'package:ticket_reselling/location_check/location_check.dart';
import 'package:ticket_reselling/location_check/check_loc.dart';

class Check extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => Location_Check_Screen()));
              },
              child: Text('Location Status')),
        ),
        body: FutureBuilder(
          future: CheckLoc.checkLoc(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text(
                    snapshot.data! ? "location Granted" : "Give Permission"),
              );
            }
            return Center(child: Text("data"));
          },
        ),
      ),
    );
  }
}
