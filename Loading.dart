import 'package:flutter/material.dart';
import 'package:com/Pages/World_Time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {
  


void setupWorldTime () async {
  WorldTime instance = WorldTime(location: 'London', flag: 'UK.svg', url: 'Europe/London');
  await instance.getTime();
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'flag': instance.flag,
    'time': instance.time,
    'location': instance.location,
    'daytime': instance.daytime,
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
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
