import 'package:flutter/material.dart';

class ToolBottombar extends StatefulWidget {
  const ToolBottombar({super.key});

  @override
  State<ToolBottombar> createState() => _ToolBottombarState();
}

class _ToolBottombarState extends State<ToolBottombar> {
  List<Map<String, dynamic>> myClass1 = [
    {
      "text": "Application tool\nfor students",
      "image": "assets/image/analytics.png",
    },
    {"text": "Competitive\nexam", "image": "assets/image/test (1).png"},
    {"text": "Tech\nenthusiast", "image": "assets/image/digital (1).png"},
  ];

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
          "Tools",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return myClass(data: myClass1[index]);
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10);
            },
            itemCount: myClass1.length,
          ),
        ],
      ),
    );
  }
}

Widget myClass({required data}) {
  return Padding(
    padding: const EdgeInsets.only(left: 25, top: 60, right: 15),
    child: Card(
      elevation: 8,
      child: Container(
        height: 130,
        width: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data["text"],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(data["image"]),
                  height: 100,
                  width: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
