import 'package:bt_c5/models/arguments.dart';
import 'package:bt_c5/router/route_config.dart';
import 'package:bt_c5/ui/s1.dart';
import 'package:bt_c5/ui/s2.dart';
import 'package:bt_c5/ui/s3.dart';
import 'package:bt_c5/ui/s4.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
      ],
    );
    return MaterialApp(
      title: 'BT C5',
      theme: ThemeData(fontFamily: 'Inter'),
      debugShowCheckedModeBanner: false,
      home: S1(arguments: Arguments()),
      onGenerateRoute: (settings) {
        final arguments = settings.arguments as Arguments;
        switch (settings.name) {
          case RouteConfig.s2:
            return MaterialPageRoute(
              builder: (BuildContext context) => S2(
                arguments: arguments,
              ),
            );
          case RouteConfig.s3:
            return MaterialPageRoute(
              builder: (BuildContext context) => S3(
                arguments: arguments,
              ),
            );
          case RouteConfig.s4:
            return MaterialPageRoute(
              builder: (BuildContext context) => S4(
                arguments: arguments,
              ),
            );
          default:
            return MaterialPageRoute(
              builder: (BuildContext context) => S1(
                arguments: arguments,
              ),
            );
        }
      },
    );
  }
}
