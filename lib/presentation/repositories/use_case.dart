import 'package:dio/dio.dart';
import 'package:flutter_application_15/presentation/models/weather_model.dart';

class GetWeatherDataUseCase{
final Dio dio;
GetWeatherDataUseCase({required this.dio});

Future<WeatherModel> getWeather(String? city)async{
  String apiKey = "e027a4031f4c6a1433dfe60649235658";
    String url = "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey";
    

    Response response = await dio.get(url,
    options: Options(
      sendTimeout: Duration(seconds: 30) ,
    receiveTimeout: Duration(seconds: 30), // 30 секунд
  ),
    );
  

    return WeatherModel.fromJson(response.data);
}
}