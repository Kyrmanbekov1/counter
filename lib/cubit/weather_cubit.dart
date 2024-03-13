import 'package:bloc/bloc.dart';
import 'package:flutter_application_15/presentation/models/weather_model.dart';
import 'package:flutter_application_15/presentation/repositories/repository_impl.dart';
import 'package:flutter_application_15/presentation/repositories/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final ConcreteWeatherRepositoryImpl repository;
  WeatherCubit({required this.repository}) : super(WeatherInitial());

  Future weatherApp(String? city)async{
    emit(WeatherLoading());
    try {
      final WeatherModel model =  await repository.weatherApp(city);
      emit(WeatherSuccess(weatherModel: model));
    } catch (e) {
      emit(WeatherError());
    }
  }
}
