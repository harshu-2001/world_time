import 'package:flutter/material.dart';
import 'package:worldtime1/classe/world_class_time.dart';
import 'package:loading_animations/loading_animations.dart';

class Loading extends StatefulWidget {
  const Loading({ Key? key }) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  
 void superc() async{

    World_time inti=World_time(location: "Kolkata",uro: "Asia/Kolkata",flag: "ping");
    await inti.getTime();
    Navigator.pushReplacementNamed(context, "/home",arguments: {
      "location":inti.location,
      "flag":inti.flag,
      "time":inti.time,
      "Date": inti.date,
      "isdaytime": inti.isdaytime,
    });
    
 } 
  @override
  void initState() {
    super.initState();
    superc();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      body: Center(
        child:LoadingBouncingGrid.square(

                backgroundColor: Colors.white,
                size: 80.0,
                duration: Duration(milliseconds: 501),
          ),
      ) 
          
    );
  }
}
