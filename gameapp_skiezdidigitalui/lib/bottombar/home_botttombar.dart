import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gameapp_skiezui/bottombar/tool_bottombar.dart';
import 'package:gameapp_skiezui/screens/helpsupport.dart';
import 'package:gameapp_skiezui/screens/login.dart';
import 'package:gameapp_skiezui/screens/selectplayers.dart';

import '../widget/notifier.dart';

class HomeBotttombar extends StatefulWidget {
  const HomeBotttombar({super.key});

  @override
  State<HomeBotttombar> createState() => _HomeBotttombarState();
}

class _HomeBotttombarState extends State<HomeBotttombar> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> myGameclass1 = [
      {"text1": "🙃", "text": "Maths", "color": Colors.green.shade900},
      {"text1": "☕", "text": "Programming", "color": Colors.purple.shade900},
      {"text1": "😀", "text": "Database", "color": Colors.red.shade900},
      {
        "text1": "💀",
        "text": "Operating system",
        "color": Colors.pink.shade900,
      },
      {"text1": "🤯", "text": "Networking"},
      {"text1": "😎", "text": "Computer Basics", "color": Colors.red.shade700},
    ];
    List<Map<String, dynamic>> myCarulslider1 = [
      {"image": "assets/image/stock-vector-quiz-game-menu-test.jpg"},
      {"image": "assets/image/database-mcqs-set-1.jpg"},
      {"image": "assets/image/images.jpg"},
      {"image": "assets/image/hq720.jpg"},
      {"image": "assets/image/public.jpg"},
      {"image": "assets/image/quiz-questions-upto-class-8-17.jpg"},
      {"image": "assets/image/children-multiple_choice-test-ex.jpg"},
    ];
    CarouselSliderController myCarouselController = CarouselSliderController();
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Color(0xff675b5b),
        iconTheme: IconThemeData(color: Colors.white, size: 25),
        title: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("gameApp")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            return RichText(
              text: TextSpan(
                text: "Hi,",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: snapshot.data!["name"],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: "\nLets play and Learn",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        actions: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("gameApp")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }
              return Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  image: DecorationImage(
                    image: NetworkImage(snapshot.data!["image"]),
                    fit: BoxFit.fill,
                  ),
                ),
              );
            },
          ),
        ],
        actionsPadding: EdgeInsets.all(10),
      ),
      drawer: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("gameApp")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return Material(
            child: Container(
              width: 250,
              color: Colors.white,
              child: ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xff675b5b),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(80),
                        topLeft: Radius.circular(80),
                      ),
                    ),
                    curve: Easing.legacy,
                    padding: EdgeInsets.only(left: 30, top: 50),
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                snapshot.data!["image"],
                              ),
                              radius: 35,
                            ),
                            Text(
                              snapshot.data!["name"],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.book, color: Colors.green),
                    title: Text("Tools"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ToolBottombar();
                          },
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.headphones, color: Colors.green),
                    title: Text("Help & Support"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Helpsupport();
                          },
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.green),
                    title: Text("Logout"),
                    onTap: () {
                      Navigator.pop(context);
                      FirebaseAuth.instance.signOut().then((value) {
                        selectPageNotifier.value=0;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Login();
                            },
                          ),
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 3, top: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Points: 50",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "Rank: Bronze",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 190,
              width: double.infinity,
              child: CarouselSlider(
                carouselController: myCarouselController,
                options: CarouselOptions(
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 4),
                  aspectRatio: 2,
                  viewportFraction: 1,
                ),
                items: myCarulslider1.map((e) {
                  return GestureDetector(
                    onTap: () {
                      showImageViewer(context, AssetImage(e["image"]));
                    },
                    child: Builder(
                      builder: (context) {
                        return Container(
                          height: 220,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            image: DecorationImage(
                              image: AssetImage(e["image"]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(
                  "Show Me the Money!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/image/bronze-medal (1).png",
                          ),
                        ),
                      ),
                    ),
                  ),
                  myCard1("assets/image/silver-medal (1).png", Icons.lock),
                  myCard1("assets/image/gold-medal (1).png", Icons.lock),
                  myCard1("assets/image/platinum (1).png", Icons.lock),
                  myCard1("assets/image/diamond (1).png", Icons.lock),
                  myCard1("assets/image/dragon (1).png", Icons.lock),
                  myCard1(
                    "assets/image/great-sphinx-of-giza (1).png",
                    Icons.lock,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Choose your battle field",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 7),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: myGameclass1.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return myGameClass(
                    data: myGameclass1[index],
                    context: context,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myCard1(String image, IconData icon) {
    return Card(
      elevation: 5,
      child: Container(
        height: 110,
        width: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(image),
            colorFilter: ColorFilter.mode(Colors.black38, BlendMode.srcIn),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(icon, size: 38, color: Colors.black87)],
        ),
      ),
    );
  }
}

Widget myGameClass({required data, required BuildContext context}) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Selectplayers();
          },
        ),
      );
    },
    child: Card(
      elevation: 5,
      child: Container(
        height: 100,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 0.5, color: Colors.black12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data["text1"],
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            Text(
              data["text"],
              style: TextStyle(
                color: data["color"],
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
