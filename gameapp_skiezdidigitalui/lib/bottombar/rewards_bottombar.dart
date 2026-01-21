import 'package:flutter/material.dart';

class RewardsBottombar extends StatelessWidget {
  const RewardsBottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff675b5b),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,size: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xff675b5b),
        title: Text(
          "Reward",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, top: 5),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Unlock Rewards",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                    elevation: 3,
                    child: Container(
                      height: 140,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 0.5, color: Colors.black54),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage("assets/image/cup.png"),
                            height: 100,
                            width: 100,
                          ),
                          Text(
                            "Collect 50 points",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  myRewarda("assets/image/cup.png", "Unlock Silver"),
                  myRewarda("assets/image/cup.png", "Unlock Gold"),
                  myRewarda("assets/image/cup.png", "Unlock Platinum"),
                  myRewarda("assets/image/cup.png", "Unlock Diamond"),
                  myRewarda("assets/image/cup.png", "Unlock Legendary"),
                  myRewarda("assets/image/cup.png", "Unlock Mythic"),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Daily Rewards",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Card(
                  elevation: 3,
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0.5, color: Colors.black54),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timelapse_rounded),
                            Text(
                              "10:00",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "Comming Soon...",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget myRewarda(String image, String text) {
  return Card(
    elevation: 3,
    child: Container(
      height: 140,
      width: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.5, color: Colors.black54),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(image),
            color: Colors.black54,
            height: 100,
            width: 100,
          ),
          Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  );
}
