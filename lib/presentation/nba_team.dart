import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import '../drawer.dart';
import '../model/nba_players_class.dart';


class NbaTeams extends StatefulWidget {
  const NbaTeams({super.key});

  @override
  State<NbaTeams> createState() => _NbaTeamsState();
}

List<Team> teamlist = [];

class _NbaTeamsState extends State<NbaTeams> {
  Future<List<Team>> getTeamData() async {
    final response = await http.get(
        Uri.parse('https://api.balldontlie.io/v1/teams'),
        headers: {"Authorization": "e89256b0-83e9-49f6-b070-974421b98cc2"});
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      for (var element in result['data']) {
        teamlist.add(Team.fromJson(element));
      }
      return teamlist;
    } else {
      throw Exception('ERROR MESSAGE: ${response.statusCode}');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTeamData();
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
            const Text('NBA TEAMS',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
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
      body: FutureBuilder<List<Team>>(
          future: getTeamData(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(itemBuilder: (context, index){
                Team user = snapshot.data![index];
                return  Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Container(
                    height: 100.0,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      leading: Container(
                          height: 100.0,
                          width: 50.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black87,
                          ),
                          child: Center(
                              child: Text(
                                user.abbreviation ?? '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ))),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Team Name: ${user.fullName ?? ''}'),
                          const SizedBox(height: 5),
                          Text("Division:  ${user.division ?? ''}"),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text("Conference: ${user.conference ?? ''}"),
                              const SizedBox(width: 10),
                              Text("City: ${user.city ?? ''}")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
            }else if(snapshot.hasError){
              throw Exception('ERROR MESSAGE: ${snapshot.error}');
            }
            return const Center(
              child: SpinKitRotatingCircle(
                color: Colors.black,
                size: 50.0,
              ),
            );
          }),
    );
  }
}
