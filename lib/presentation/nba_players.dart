import 'dart:convert';
import 'dart:core';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../drawer.dart';
import '../model/nba_players_class.dart';

class NbaPlayers extends StatefulWidget {
  const NbaPlayers({super.key});

  @override
  State<NbaPlayers> createState() => _NbaPlayersState();
}

List<Data> players = [];

class _NbaPlayersState extends State<NbaPlayers> {
  Future<List<Data>> getPlayers() async {
    final response = await http.get(
      Uri.parse("https://api.balldontlie.io/v1/players"),
      headers: {"Authorization": "e89256b0-83e9-49f6-b070-974421b98cc2"},
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      for (var element in result['data']) {
        players.add(Data.fromJson(element));
      }
      return players;
    } else {
      throw Exception('ERROR ${response.statusCode}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPlayers();
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
            const Text('NBA Players',
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
      body: FutureBuilder<List<Data>>(
          future: getPlayers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Data user = snapshot.data![index];
                    return Padding(
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
                              margin: const EdgeInsets.only(bottom: 10),
                              height: 50.0,
                              width: 50.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black87,
                              ),
                              child: Center(
                                  child: Text(
                                user.jerseyNumber ?? '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ))),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(user.firstName ?? ''),
                                  const SizedBox(width: 10),
                                  Text(user.lastName ?? ''),
                                ],
                              ),
                              Text('Team: ${user.team?.fullName ?? ''}'),
                              Row(
                                children: [
                                  Text("Position: ${user.position ?? ''}"),
                                  const SizedBox(width: 10),
                                  Text("Height: ${user.height ?? ''}"),
                                  const SizedBox(width: 10),
                                  Text("Weight: ${user.weight ?? ''}")
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('ERROR MESSAGE: ${snapshot.error}');
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
