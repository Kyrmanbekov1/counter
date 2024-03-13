import 'package:flutter/material.dart';
import 'package:flutter_application_15/cubit/weather_cubit.dart';
import 'package:flutter_application_15/home1.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, this.city});

  final String? city;
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  

  void _incrementCounter() {
    setState(() {
      if (_counter < 10) _counter++;
    });
  }
   void _incrementweather() {
    setState(() {
       BlocProvider.of<WeatherCubit>(context).weatherApp('London');
    });
  }

  void decreaseCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  // @override
  // void initState() {
  //   BlocProvider.of<WeatherCubit>(context).weatherApp('');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Value $_counter',
              style: const TextStyle(
                fontSize: 60.0,
                color: Colors.black,
              ),
            ),
             Text(
            'k',
  style: TextStyle(
    color: Colors.black,
    fontSize: 15,
  ),
),
            SizedBox(height: 400.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_counter < 10)
                  FloatingActionButton(
                    onPressed: _incrementCounter,
                    backgroundColor: Colors.deepPurple,
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                SizedBox(height: 15),
                if (_counter > 0)
                  FloatingActionButton(
                    onPressed: decreaseCounter,
                    backgroundColor: Colors.deepPurple,
                    child: const Icon(Icons.remove, color: Colors.white),
                  ),
              ],
            ),
            SizedBox(width: 60),
            FloatingActionButton(
              onPressed:_incrementweather , 
            )
          ],
        ),
      ),
    );
  }
}
