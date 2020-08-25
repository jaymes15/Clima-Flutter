import 'networking.dart';
import 'location.dart';


const String kApiKey = 'APPID=58aa1cc0f3d6ef06ce61b881bd643c57';

class WeatherModel {

  Future<dynamic> getCity(String city) async{


    Networking networking = Networking(
        url: "https://api.openweathermap.org/data/2.5/weather?q=$city&$kApiKey&units=metric"
    );
    var weather = await networking.getWeather();
    return weather;
  }

  Future<dynamic> getLocation() async{
    Location location =  Location();
    await location.getLocation();
    var latitude = location.latitude;
    var longitude = location.longitude;
    Networking networking = Networking(
        url: "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&$kApiKey&units=metric"
    );
    var weather = await networking.getWeather();
    return weather;
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
