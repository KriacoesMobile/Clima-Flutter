import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getCurrentPosition() async {
    try {
      var position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (exception) {
      latitude = null;
      longitude = null;
    }
  }
}
