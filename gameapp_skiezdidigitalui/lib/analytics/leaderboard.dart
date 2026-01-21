import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Achivements"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Container(
              height: 350,
              width: 320,
              decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        myValue("Rank"),
                        myValue("1"),
                        myValue("2"),
                        myValue("3"),
                        myValue("4"),
                      ],
                    ),
                    Column(
                      children: [
                        myValue("Name"),
                        myValue("Koperundevan"),
                        myValue("Thiru"),
                        myValue("Vimal"),
                        myValue("Thanigai"),
                      ],
                    ),
                    Column(
                      children: [
                        myValue("Points"),
                        myValue("600"),
                        myValue("450"),
                        myValue("400"),
                        myValue("300"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget myValue(String text) {
  return Text(
    text,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
  );
}
