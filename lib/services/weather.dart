import 'package:weather_app/services/location.dart';
import 'package:http/http.dart';
import 'package:weather_app/services/networking.dart';

const apikey='27a3855131b493c920f1a283d511eead';
const openWeatherMapurl='https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getcityweather(String cityname)async{
      var url='https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apikey&units=metric';
      NetworkHelper networkHelper=NetworkHelper(url);

      var data=await networkHelper.getData();

      return data;
  }
  Future<dynamic> getLocationWeather()async{
    Location location = Location();
    await location.getCurrentLocation();
    double lat=location.latitude;
    double lon=location.longitute;
    NetworkHelper networkHelper= NetworkHelper( '$openWeatherMapurl?lat=$lat&lon=$lon&appid=$apikey&units=metric');
    var data =await networkHelper.getData();
    return data;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
