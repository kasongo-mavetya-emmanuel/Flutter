import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const apiKey='f1dd95aecc291fbe1ea5627535f71319';
const kOpenWeatherMapURL='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

 Future<dynamic> getCityWeather(String cityName)async{
    var url='$kOpenWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper=NetworkHelper(url);
    var weatherData=await networkHelper.getdata();
    return weatherData;
  }


  Future<dynamic> getLocationWeather() async{
    Location location=Location();
    await location.getCurrentLocation();
    // latitude=location.latitude;
    // longitude=location.longitude;
    NetworkHelper networkHelper=NetworkHelper('$kOpenWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData= await networkHelper.getdata();

    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
