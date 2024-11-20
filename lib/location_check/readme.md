# Location Service Status Checker
A Flutter application to check whether the location service is on or off on a device. This project utilizes the `location` package to manage location permissions and check the service status.

## Getting Started
Follow these steps to set up and run the project.

### Steps
#### 1. Add Location Dependency
First, add the `location` package to your `pubspec.yaml` file:

```yaml 
dependencies: 
  flutter: 
    sdk: flutter
 
  location: ^4.4.0
 ```

#### 2. Create Two Pages

#### 3. Setup the location

```dart
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class CheckLoc {

  // checks the location status 
  static Future<bool> checkLoc() async {
    Location location = Location();  
    bool serviceEnabled;
    PermissionStatus _permissionGranted;

    // checks location service
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      print("service $serviceEnabled");
      // if (!serviceEnabled) {
      //   return;
      // }
    }
    
    // checks location permission
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        debugPrint(_permissionGranted.toString());
      }
    }

    return serviceEnabled;
  }
}
```
#### 4. Integrate with pages
There is multiple ways to integrate location with pages, we use `FutureBuilder` Widget.

```dart
FutureBuilder(
          future: CheckLoc.checkLoc(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            // write your code here
            if (snapshot.hasData) {
            // if(snapshot == null) return Text("data");
            return Center(
               child: Text(
                snapshot.data! ? "location Granted" : "Give Permission"),
                  );
            }
return Center(child: Text("data"));
        );
``` 

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

