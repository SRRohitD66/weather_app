import 'package:flutter/material.dart';
import 'package:weather_app/screens/location_screens.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void getlocation() async {
    WeatherModel weatherModel=WeatherModel();

    var data=await weatherModel.getLocationWeather();

   Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(localweather: data)));

  }


  @override
  void initState()
  {
    super.initState();
    getlocation();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: SpinKitDoubleBounce(
         color: Colors.white,
         size: 100,
       ),
     ),
    );
  }
}
