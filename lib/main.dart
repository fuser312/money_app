import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_app/controllers/my_money_controller.dart';
import 'package:money_app/screens/amount.dart';
import 'package:money_app/screens/home.dart';
import 'package:money_app/screens/to_who.dart';

void main() {
  Get.put(MyMoneyController());
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money App',
      theme: ThemeData(
        primaryColor: Color(0xffc1078c),
        accentColor: Color(0xfffefefe),
        // fontFamily: 'Montserrat',

        textTheme: const TextTheme(

          headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: Color(0xfffefefe)),
          headline6: TextStyle(fontSize: 14.0),
          bodyText1: TextStyle(fontSize: 16.0, color: Color(0xfffefefe)),
          bodyText2: TextStyle(fontSize: 16.0,),
        ),

      ),
      initialRoute: "/",
      defaultTransition: Transition.zoom,
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(
            name: '/amount',
            page: () => Amount(),
            transition: Transition.leftToRight),
        GetPage(
            name: '/toWho',
            page: () => ToWho(),
            transition: Transition.leftToRight),
      ],
      home: Home(),
    );
  }
}
