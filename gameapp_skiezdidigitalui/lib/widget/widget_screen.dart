import 'package:flutter/material.dart';
import 'package:gameapp_skiezui/bottombar/anlysis_bottombar.dart';
import 'package:gameapp_skiezui/bottombar/home_botttombar.dart';
import 'package:gameapp_skiezui/bottombar/profile_bottombar.dart';
import 'package:gameapp_skiezui/bottombar/rewards_bottombar.dart';
import 'package:gameapp_skiezui/widget/bottombar.dart';
import 'package:gameapp_skiezui/widget/notifier.dart';

class WidgetScreen extends StatefulWidget {
  const WidgetScreen({super.key});

  @override
  State<WidgetScreen> createState() => _WidgetScreenState();
}

class _WidgetScreenState extends State<WidgetScreen> {
  List pages = [
    HomeBotttombar(),
    RewardsBottombar(),
    AnlysisBottombar(),
    ProfileBottombar(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top:WidgetsApp.showPerformanceOverlayOverride,
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: selectPageNotifier,
          builder: (context, selectPage, child) {
            return pages.elementAt(selectPage);
          },
        ),
        bottomNavigationBar: Bottombar(),
      ),
    );
  }
}
