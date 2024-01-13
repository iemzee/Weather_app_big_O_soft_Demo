// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_big_o_soft_demo/consts/colors.dart';
import 'package:weather_big_o_soft_demo/consts/strings.dart';
import 'package:weather_big_o_soft_demo/home_screen/home_screen.dart';
import 'package:weather_big_o_soft_demo/home_screen/weather_bloc.dart';
import 'package:weather_big_o_soft_demo/models/weather_model.dart';




class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    var cityController = TextEditingController();

    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height*1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, state) {
                if (state is WeatherIsNotSearched) {
                  return Container(
                    padding: const EdgeInsets.only(
                      left: 32,
                      right: 32,
                    ),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Search Weather",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                        const Text(
                          "Instantly",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                        24.heightBox,
                        
                        TextFormField(
                          controller: cityController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white70,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid)),
                            hintText: "City Name",
                            hintStyle: TextStyle(color: Colors.white70),
                          ),
                          style: const TextStyle(color: Colors.white),
                        ),
                        30.heightBox,
                        GestureDetector(
                          onTap: () {
                            weatherBloc.add(FetchWeather(cityController.text));
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: BoxDecoration(
                                color: cardColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "Search",
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),
                              ),
                            ),
                          ),
                        ),
                         120.heightBox,
                         const Text(
                          "Weather",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                        const Text(
                          " Based on Location",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                       const  SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context) => const HomeScreen(),));
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text(
                                "Instant Weather by Location",textAlign: TextAlign.center,
                                style:
                                    TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w200),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                } else if (state is WeatherIsLoading)
                  return  const Center(child: CircularProgressIndicator());
                else if (state is WeatherIsLoaded)
                  return ShowWeather(state.getWeather, cityController.text);
                else
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.8,
                      child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      
                        children: [
                          Center(
                            child: Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width*0.6,
                              decoration: BoxDecoration(color: Colors.teal, borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child:  Text(
                                  "Please Search with any City ",
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
              },
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ShowWeather extends StatelessWidget {
  WeatherModel weather;
  // ignore: prefer_typing_uninitialized_variables
  final city;
  ShowWeather(this.weather, this.city, {super.key});

  @override
  Widget build(BuildContext context) {
  
    return Container(
      padding: const EdgeInsets.only(right: 25,left: 25),
   height: MediaQuery.of(context).size.height*0.8,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ 
          Text(
            city,
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
           10.heightBox,
          Text(
            "${weather.getTemp.round()}$degree",
            style: const TextStyle(color: Colors.white70, fontSize: 50),
          ),
          const Text(
            "Temprature",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "${weather.getMinTemp.round()}$degree",
                    style: const TextStyle(color: Colors.white70, fontSize: 30),
                  ),
                  const Text(
                    "Min Temprature",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "${weather.getMaxTemp.round()}$degree",
                    style: const TextStyle(color: Colors.white70, fontSize: 30),
                  ),
                  const Text(
                    "Max Temprature",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          20.heightBox,
          SizedBox(
            width: double.infinity,
            height: 50,
            child: TextButton(
              onPressed: () {
                BlocProvider.of<WeatherBloc>(context).add(ResetWeather());
              },
              child: const Text(
                "Search",
                style: TextStyle(color: Colors.white70, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
