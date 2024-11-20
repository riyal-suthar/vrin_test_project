import 'package:flutter/material.dart';
import 'package:location/location.dart';

class CheckLoc {
  static Future<bool> checkLoc() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus _permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      print("service $serviceEnabled");
      // if (!serviceEnabled) {
      //   return;
      // }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        debugPrint(_permissionGranted.toString());
      }
    }

    return serviceEnabled;
  }
  // check() async {
  //   Location location = Location();
  //
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  // }
}
