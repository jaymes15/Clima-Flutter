import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


const String kApiKey = 'APPID=58aa1cc0f3d6ef06ce61b881bd643c57';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  double latitude;
  double longitude;

  @override
  initState()  {
    // TODO: implement initState
    super.initState();
    getLocationData();


  }

  void getLocationData() async{
    Location location =  Location();
    await location.getLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    Networking networking = Networking(
        url: "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&$kApiKey&units=metric"
    );
    var weather = await networking.getWeather();

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LocationScreen(weather: weather),
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size:100.0,
        ),
      ),

    );
  }
}
