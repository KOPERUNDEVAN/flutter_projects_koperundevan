import 'package:flutter/material.dart';
import 'package:gameapp_skiezui/widget/notifier.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectPageNotifier,
      builder: (context, selectPage, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined, color: Colors.black38),
              label: "Home",
              selectedIcon: Icon(Icons.home_outlined, color: Colors.black),
            ),
            NavigationDestination(
              icon: Icon(Icons.redeem_outlined, color: Colors.black38),
              label: "Reward",
              selectedIcon: Icon(Icons.redeem_outlined, color: Colors.black),
            ),
            NavigationDestination(
              icon: Icon(Icons.analytics_outlined, color: Colors.black38),
              selectedIcon: Icon(Icons.analytics_outlined, color: Colors.black),
              label: "Analytics",
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline,color: Colors.black38,),
              selectedIcon: Icon(
                Icons.person_outline,
                color: Colors.black,
              ),
              label: "Profile",
            ),
          ],
          backgroundColor: Colors.white,
          height: 65,
          indicatorColor: Colors.white,
          selectedIndex: selectPage,
          onDestinationSelected: (value) {
            selectPageNotifier.value = value;
          },
        );
      },
    );
  }
}
