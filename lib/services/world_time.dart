import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location = ''; //Location name for the UI
  String time = ''; //  the time in that location
  String flag = ''; // Url to an asset flag icon
  String url = ''; // location url for api endpoint
  bool isDayTime = false;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    // Make the request
    print('Hello');

    try {
      Response response =
          await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      print(data);

      // Get properties
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      // print(dateTime);

      DateTime now = DateTime.parse(dateTime);
      now = now.subtract(Duration(hours: int.parse(offset)));
      // print(now);

      //Set the time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      // isDayTime = false;
      print(isDayTime);
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Este es el error: $e');
      time = 'Este es el error: $e';
    }
  }
}
