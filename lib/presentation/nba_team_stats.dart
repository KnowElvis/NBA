import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//e89256b0-83e9-49f6-b070-974421b98cc2
import '../drawer.dart';
import 'package:http/http.dart' as http;

class NbaTeamStats extends StatefulWidget {
  const NbaTeamStats({super.key});

  @override
  State<NbaTeamStats> createState() => _NbaTeamStatsState();
}

class _NbaTeamStatsState extends State<NbaTeamStats> {
// List<Data> teamstats = [];
//   Future getteamstat() async{
//     final response = await http.get(Uri.parse("https://api.balldontlie.io/v1/stats" "Authorization: e89256b0-83e9-49f6-b070-974421b98cc2"));
//     if(response.statusCode == 200){
//       final data = jsonDecode(response.body);
//       for(var elements in data['data']){
//         teamstats.add(Data.fromJson(elements));
//       }
//     }
//   }
bool _isLoading = true;
@override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),(){
      setState(() {
        _isLoading = false;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerClass(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('NBA TEAMS STATS',style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
            Container(
              width: 50.0,
              height: 30.0,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/basketball.jpeg'),
                ),
              ),
            ),
          ],
        ),
      ),
      body:   Center(
        child: _isLoading? const SpinKitRotatingCircle(
          color: Colors.black,
          size: 50.0,
          duration: Duration(milliseconds: 500),
        ):const Text('PAGE NOT FOUND',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
      ),
    );
  }
}

