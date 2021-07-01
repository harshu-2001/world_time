//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:worldtime1/pages/choose_location.dart';
import 'package:worldtime1/pages/home.dart';
import 'package:worldtime1/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/":(context)=>Loading(),
      "/home":(context)=>Home(),
      "/location":(context)=>Choose(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
