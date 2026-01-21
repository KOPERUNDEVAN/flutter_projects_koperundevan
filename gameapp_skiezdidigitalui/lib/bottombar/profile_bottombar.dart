import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gameapp_skiezui/widget/notifier.dart';

import '../screens/login.dart';

class ProfileBottombar extends StatelessWidget {
  const ProfileBottombar({super.key});

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
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("gameApp")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              return Column(
                children: [
                  SizedBox(height: 10),
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(snapshot.data!["image"]),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 140),
                      Text(
                        snapshot.data!["name"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 110),
                      Text(
                        snapshot.data!["email"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          border: Border.all(width: 1, color: Colors.black12),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.gamepad_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              "27",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Game wins",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade700,
                          border: Border.all(width: 1, color: Colors.black12),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.attach_money,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              "50",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Points",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.brown.shade800,
                          border: Border.all(width: 1, color: Colors.black12),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/image/bronze-medal (1).png",
                              ),
                              height: 70,
                              width: 70,
                            ),
                            Text(
                              "Bronze",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          Divider(thickness: 1),
          ListTile(
            onTap: () {},
            leading: Text(
              "Notifications",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            tileColor: Colors.white,
            trailing: Text("⏰", style: TextStyle(fontSize: 20)),
            minTileHeight: 45,
          ),
          Divider(thickness: 1),
          ListTile(
            onTap: () {},
            leading: Text(
              "Settings",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            tileColor: Colors.white,
            trailing: Text("🔑", style: TextStyle(fontSize: 20)),
            minTileHeight: 47,
          ),
          ListTile(
            onTap: () {},
            leading: Text(
              "Privacy",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            tileColor: Colors.white,
            trailing: Text("🙈", style: TextStyle(fontSize: 20)),
            minTileHeight: 47,
          ),
          Divider(thickness: 1),
          ListTile(
            onTap: () {},
            leading: Text(
              "Invite Friends",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            tileColor: Colors.white,
            trailing: Text("🤝", style: TextStyle(fontSize: 20)),
            minTileHeight: 47,
          ),
          ListTile(
            onTap: () {},
            leading: Text(
              "Feedback",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            tileColor: Colors.white,
            trailing: Text("💬", style: TextStyle(fontSize: 20)),
            minTileHeight: 47,
          ),
          ListTile(
            onTap: () {},
            leading: Text(
              "About App",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            tileColor: Colors.white,
            trailing: Text("📚", style: TextStyle(fontSize: 20)),
            minTileHeight: 47,
          ),
        ],
      ),
    );
  }
}
