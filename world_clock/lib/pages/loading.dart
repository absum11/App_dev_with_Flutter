import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime  obj1= WorldTime(location:'Berlin',flag:'germany.png',url:'Europe/Berlin');
     await obj1.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': obj1.location,
      'flag': obj1.flag,
      'time': obj1.time,
      'isDaytime': obj1.isDaytime,
    });
  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: Center(
        child:SpinKitDancingSquare(
          color: Colors.grey[500],
          size:90.0,
        ),
      ),
    );
  }
}
