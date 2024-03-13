import 'package:flutter/material.dart';
import 'package:flutter_application_15/cubit/weather_cubit.dart';
import 'package:flutter_application_15/presentation/repositories/repository_impl.dart';
import 'package:flutter_application_15/presentation/repositories/use_case.dart';
import 'package:flutter_application_15/presentation/repositories/weather_repository.dart';
import 'package:flutter_application_15/presentation/screens/home.dart';
import 'package:flutter_application_15/home1.dart';
import 'package:flutter_application_15/presentation/widgets/dio_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => GetWeatherDataUseCase(dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
        RepositoryProvider(
          create: (context) => ConcreteWeatherRepositoryImpl(useCAse: RepositoryProvider.of<GetWeatherDataUseCase>(context)),
        ),
        
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WeatherCubit(
                repository:
                    RepositoryProvider.of<ConcreteWeatherRepositoryImpl>(
                        context)),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
