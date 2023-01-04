import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stepperui/home/homepage.dart';
import 'package:stepperui/home/provider/homeprovider.dart';
import 'package:stepperui/splashScreen/splashPage.dart';

void main() {
  
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SpalshScreen(),
          'home': (context) => homePage(),
        },
      ),
    ),
  );
}
