import 'package:geolocator/geolocator.dart';

class Location{
  double longitude;
  double latitude;

  Future<void> getLocation () async{
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;

    }catch(error){
      print(error);
    }

  }
}