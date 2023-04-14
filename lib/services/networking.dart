import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper{
  NetworkHelper( this.url);
  final String url;
  Future getData()async{
    Response response = await get(Uri.parse(
        url));

    if (response.statusCode == 200) {
      String data = response.body;
      var decodedata=jsonDecode(data);

      return decodedata;
    }
    else
    {
      print(response.statusCode);

    }
  }

}