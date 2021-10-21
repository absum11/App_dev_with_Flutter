import 'package:flutter/material.dart';
import 'package:world_clock/pages/choose_location.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
      print(data);
    // set background image
    String bgImage = data['isDaytime'] ? 'Blue_Sky.png' : 'night.jpeg';
    Color bgColor= data['isDaytime'] ? Colors.blue  : Colors.blue[700];
    return Scaffold(

      backgroundColor: bgColor,
         body:SafeArea(
             child: Container(
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('assets/$bgImage'),
                   fit: BoxFit.cover,
                 ),
               ),
               child: Padding(
                 padding:const EdgeInsets.fromLTRB(0, 100.0, 0, 0),
                 child: Column(
                   children:<Widget>[
                    FlatButton.icon(
                      onPressed:() async {
                        dynamic result=await Navigator.pushNamed( context,'/location');
                        setState((){
                          data={
                            'time':result['time'],
                            'location':result['location'],
                            'flag':result['flag'],
                            'isDaytime':result['isDaytime']
                          };
                        });
                      } ,
                        icon:Icon(
                            Icons.edit_location,
                            color:Colors.grey[300],
                        ),
                        label:Text(
                          'Edit Location',
                          style:TextStyle(
                            color: Colors.amber[50],
                          ),
                        )
                    ),
                     SizedBox(height:20.0),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text(
                           data['location'],
                           style:TextStyle(
                             fontSize: 25.0,
                             letterSpacing: 2.0,
                             color: Colors.amber[200],
                           )
                         ),
                       ]
                     ),
                     SizedBox(height:20.0),
                     Text(
                       data['time'],
                       style: TextStyle(
                         fontSize: 50.0,
                         color:Colors.amber[200],
                       ),
                     )
                   ]
                 ),
               ),
             )
         )
    );
  }
}
