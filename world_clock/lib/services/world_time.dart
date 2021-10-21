import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name
  String time; // time at that location
  String url;  //url endpoint
  String flag; // asset flag icon url
  bool isDaytime;

  WorldTime({this.location,this.flag, this.url});

  Future<void> getTime() async {

    try {
      // make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);
      print(datetime);
      print(offset);
      //print(offset);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      print(offset[0]);

      int tmp = offset[0] == "+" ? now.hour+int.parse(offset) : now.hour-int.parse(offset);

      print(tmp);

      now = now.add(Duration(hours: tmp));

      print(now.hour);

      // set the time property
      isDaytime= now.hour > 6 && now.hour < 19 ? true : false;

      // print(isDaytime);
      time= DateFormat.jm().format(now);
    }
    catch(e){
      print(e);
      time='could not get time';

    }

  }
}
