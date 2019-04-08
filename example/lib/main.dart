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
  String _platformVersion = 'Unknown';
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String startLatitude;
  String startLongitude;
  String endLatitude;
  String endLongitude;

  double distance = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterGpsDistance.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
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

  void _handleSubmitted() {
    _formKey.currentState.save();

    // TODO
    print("startLatitude: " + startLatitude);
    print("startLongitude: " + startLongitude);
    print("endLatitude: " + endLatitude);
    print("endLongitude: " + endLongitude);

    setState(() {
      distance += 1;
    });
  }
}
