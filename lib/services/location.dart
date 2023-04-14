import 'package:geolocator/geolocator.dart';

class Location{
  double latitude=0;
  double longitute=0;

  void something(LocationPermission permission){
    if(permission == LocationPermission.denied || permission == LocationPermission.deniedForever || permission==LocationPermission.unableToDetermine)
      throw('Can noot be a accesed');

  }
  Future<void> getCurrentLocation()async{

      LocationPermission permission = await Geolocator.requestPermission();

      print(permission);
      try {
        something(permission);
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);

       latitude =position.latitude;
       longitute=position.longitude;
      }
      catch(e)
      {
        print(e);
      }
    }



}