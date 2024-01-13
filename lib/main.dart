import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_big_o_soft_demo/home_screen/search_weather.dart';
import 'package:weather_big_o_soft_demo/home_screen/weather_bloc.dart';
import 'package:weather_big_o_soft_demo/repository/weather_repository.dart';
import 'package:weather_big_o_soft_demo/widgets/our_themes.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Weather App",
      debugShowCheckedModeBanner: false,
      theme: CoustomThemes.lightTheme,
      darkTheme: CoustomThemes.darkTheme,
      themeMode: ThemeMode.system,
      home:              SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: BlocProvider(
              create: (context) => WeatherBloc(WeatherRepo()),
              child: const SearchPage(),
            ),
            ),
      ));
  }
}
