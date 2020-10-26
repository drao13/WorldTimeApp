import 'package:com/Pages/World_Time.dart';
import 'package:flutter/material.dart';

class country extends StatefulWidget {
  @override
  _countryState createState() => _countryState();
}

class _countryState extends State<country> {

  List<WorldTime> locations = [
    WorldTime(location: 'London', flag: 'UK.png', url: 'Europe/London'),
    WorldTime(location: 'Toronto', flag: 'Canada.png', url:'America/Toronto'),
    WorldTime(location: 'Seoul', flag: 'NorthKorea.png', url:'Asia/Seoul'),
    WorldTime(location: 'Hong Kong', flag: 'China.png', url:'Asia/Hong_Kong'),
    WorldTime(location: 'Moscow', flag: 'Russia.png', url:'Europe/Moscow'),
    WorldTime(location: 'New York', flag: 'USA.png', url:'America/New_York'),
    WorldTime(location: 'Berlin', flag: 'Germany.png', url:'Europe/Berlin'),
    WorldTime(location: 'Kolkata', flag: 'India.png', url:'Asia/Kolkata'),
    WorldTime(location: 'Cancun', flag: 'Mexico.png', url:'America/Cancun'),
  ];

  void newTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'flag': instance.flag,
      'time': instance.time,
      'location': instance.location,
      'daytime': instance.daytime,
    });
  }

  @override
  void initState() {
    super.initState();
    print('initState function ran');
  }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    newTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('Images/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
          ),
    );
  }
}
