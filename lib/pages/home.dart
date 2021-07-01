
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime1/classe/world_class_time.dart';
//import 'package:world_time/pages/choose_location.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var data;
  
  @override
  Widget build(BuildContext context) {

    data=data!=null?data:ModalRoute.of(context)!.settings.arguments ;
    print(data);

    //set background 
    String bgimage=data['isdaytime']?'day.jpg':'night.jpg';
    var bgcolor=data['isdaytime']?Colors.black:Colors.grey.shade800;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/$bgimage"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(bgcolor, BlendMode.softLight)

          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5.0, 80.0, 5.0, 10.0),
        
          child: SafeArea(
            child:Column(
            children: <Widget>[
            FlatButton.icon(
              onPressed: ()async{

               // ignore: await_only_futures
               dynamic result= await Navigator.pushNamed(context, "/location");
               if (result!=null){
                 setState(() {
                 data={
                     "location":result['location'],
                     "flag":result['flag'],
                     "time":result['time'],
                     "Date": result['Date'],
                      "isdaytime": result['isdaytime'],
                 };
               });
               }
              }, 
              label: Text(
                "Set Location",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0
                ),), 
              icon: Icon(Icons.location_pin,
              size: 25,
              color: Colors.white,),
              

            ),
            SizedBox(height:20),
            Row(
              
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(data['location'],
                style: TextStyle(
                  fontSize: 40,
                  letterSpacing: 4.0,
                  color: Colors.cyan.shade50
                ),),
                
                
              ],
            ),
             SizedBox(height:20),
            Text(data['Date'],
                style: TextStyle(
                  fontSize: 25,
                  letterSpacing: 2.0,
                  color: Colors.grey.shade200,
                ),),
            SizedBox(height:20),
            Text(data['time'],
                style: TextStyle(
                  fontSize: 50,
                  letterSpacing: 2.0,
                  color: Colors.grey.shade200,
                ),),
          ]
          ),
          ),
        ),
      )
      
    );
  }
}