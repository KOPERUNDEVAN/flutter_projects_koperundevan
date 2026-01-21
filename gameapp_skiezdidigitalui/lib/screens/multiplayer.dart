import 'package:flutter/material.dart';
import 'package:gameapp_skiezui/screens/questions.dart';

class Multiplayer extends StatelessWidget {
  const Multiplayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                "Waiting for opponent",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
            Text("Matching...", style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CircleAvatar(radius: 25),
                    Text(
                      "YOU",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(children: [Text("Rank :"), Text("Bronze")]),
                    Row(children: [Text("Points :"), Text("50")]),
                  ],
                ),
                Container(
                  height: 180,
                  width: 1,
                  decoration: BoxDecoration(color: Colors.black),
                ),
                Column(
                  children: [
                    CircleAvatar(radius: 25),
                    Text(
                      "Opponent",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Row(children: [Text("Rank :"), Text("Bronze")]),
                    Row(children: [Text("Points :"), Text("50")]),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 127, top: 30),
              child: Row(
                children: [
                  Text(
                    "Match starts in ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(" 25", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Questions();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff675b5b),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(
                "Start",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
