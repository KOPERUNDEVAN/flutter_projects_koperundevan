import 'package:flutter/material.dart';
import 'package:gameapp_skiezui/analytics/all.dart';
import 'package:gameapp_skiezui/analytics/leaderboard.dart';
import 'package:gameapp_skiezui/analytics/performance.dart';

class AnlysisBottombar extends StatelessWidget {
  const AnlysisBottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Color(0xff675b5b),
          title: Text(
            "Leaderboards",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelStyle: TextStyle(color: Colors.white),
            tabs: [
              Tab(text: "Today"),
              Tab(text: "Week"),
              Tab(text: "All"),
            ],
            indicatorColor: Colors.black,
            dividerColor: Colors.white,
            labelColor: Colors.white,
          ),
        ),
        body: TabBarView(children: [Leaderboard(), Performance(), All()]),
      ),
    );
  }
}
