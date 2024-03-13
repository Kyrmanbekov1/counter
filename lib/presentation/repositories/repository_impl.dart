import 'package:flutter_application_15/presentation/models/weather_model.dart';
import 'package:flutter_application_15/presentation/repositories/use_case.dart';
import 'package:flutter_application_15/presentation/repositories/weather_repository.dart';

class ConcreteWeatherRepositoryImpl implements WeatherRepository {
  ConcreteWeatherRepositoryImpl({required this.useCAse});

  @override
  final GetWeatherDataUseCase useCAse;

  @override
  Future<WeatherModel> weatherApp(String? city) async {
    return await useCAse.getWeather(city);
  }
}