import 'package:flutter/material.dart';
import 'package:nba_basketball/presentation/nba_players.dart';
import 'package:nba_basketball/presentation/nba_team.dart';
import 'package:nba_basketball/presentation/nba_team_stats.dart';


class DrawerClass extends StatelessWidget {
  const DrawerClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  children: [
                    const Text(
                      'NBA',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50.0,
                      ),
                    ),
                    Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/basketball.jpeg'),
                        ),
                      ),
                    ),
                  ],
                )),
             ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NbaPlayers()));
              },
              leading: const Icon(
                Icons.person,
                size: 40,
                color: Colors.black,
              ),
              title: const Text(
                'NBA PLAYERS',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
             ListTile(
               onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NbaTeams()));
               },
              leading:  const Icon(
                Icons.groups_3,
                size: 40,
                color: Colors.black,
              ),
              title: const Text(
                'NBA TEAMS',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
             ListTile(
               onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const NbaTeamStats()));
               },
              leading: const Icon(
                Icons.bar_chart,
                size: 40,
                color: Colors.black,
              ),
              title: const Text(
                'NBA TEAMS STATS',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
