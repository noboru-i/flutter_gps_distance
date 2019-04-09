import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gps_distance/flutter_gps_distance.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String startLatitude = "0";
  String startLongitude = "0";
  String endLatitude = "0";
  String endLongitude = "0";

  double distance = 0;

  Future<void> _calculateDistance() async {
    double resultDistance;

    try {
      resultDistance = await FlutterGpsDistance.calculateDistance(
        double.parse(startLatitude),
        double.parse(startLongitude),
        double.parse(endLatitude),
        double.parse(endLongitude),
      );
    } on PlatformException catch(e) {
      print("PlatformException");
      print(e);
      resultDistance = 0;
    }

    if (!mounted) return;

    setState(() {
      distance = resultDistance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(
          margin: new EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'start latitude',
                    border: UnderlineInputBorder(),
                  ),
                  onSaved: (String value) {
                    startLatitude = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'start longitude',
                    border: UnderlineInputBorder(),
                  ),
                  onSaved: (String value) {
                    startLongitude = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'end latitude',
                    border: UnderlineInputBorder(),
                  ),
                  onSaved: (String value) {
                    endLatitude = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'end longitude',
                    border: UnderlineInputBorder(),
                  ),
                  onSaved: (String value) {
                    endLongitude = value;
                  },
                ),
                RaisedButton(
                  child: const Text('SUBMIT'),
                  onPressed: _handleSubmitted,
                ),
                Text("distance: " + distance.toString() + "m")
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleSubmitted() async {
    _formKey.currentState.save();

    print("startLatitude: " + startLatitude);
    print("startLongitude: " + startLongitude);
    print("endLatitude: " + endLatitude);
    print("endLongitude: " + endLongitude);

    _calculateDistance();
  }
}
