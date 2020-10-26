import 'package:flutter/material.dart';
import 'package:com/Pages/World_Time.dart';
import 'package:com/Pages/Country.dart';
import 'package:com/Pages/Loading.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

  data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
  print(data);

    String BackgroundImage = data['daytime'] ? 'DayTime.png' : 'NightTime.png.jpg';
    Color BackgroundColor = data['daytime'] ? Colors.deepOrange : Colors.indigo;


    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('Images/$BackgroundImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'flag': result['flag'],
                      'daytime': result['daytime'],
                    };
                  });
                },
                icon: Icon(
                    Icons.edit_location,
                  color: Colors.white,
                ),
                label: Text(
                    'Change Location',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                  ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              )
            ],
          ),
      ),
        ),
    ),
    );
  }
}
