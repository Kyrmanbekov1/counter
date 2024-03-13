import 'package:dio/dio.dart';
import 'package:flutter_application_15/presentation/models/weather_model.dart';
import 'package:flutter_application_15/presentation/repositories/use_case.dart';

abstract class WeatherRepository {
  WeatherRepository({required this.useCAse});
  final GetWeatherDataUseCase useCAse;
  Future<void> weatherApp(String? city);
}


