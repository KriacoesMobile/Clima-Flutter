import 'package:clima/utilities/constants.dart';

import 'location.dart';
import 'networking.dart';

class WeatherData {
  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getCurrentPosition();

    double latitude = location.latitude;
    double longitude = location.longitude;

    String apiURL =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

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
