import 'package:clima/utilities/constants.dart';

import 'location.dart';
import 'networking.dart';

class WeatherData {
  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getCurrentPosition();

    if ((location.latitude == null) || (location.longitude == null)) {
      return null;
    }

    String apiURL =
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(apiURL);

    return await networkHelper.getData();
  }

  Future<dynamic> getCityData(String cityName) async {
    String apiURL =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';

    NetworkHelper networkHelper = NetworkHelper(apiURL);
    return await networkHelper.getData();
  }
}
