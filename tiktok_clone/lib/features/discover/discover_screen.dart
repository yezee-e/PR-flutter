import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({super.key});

  final tabs = [
    "Top",
    "Users",
    "Videos",
    "Sounds",
    "LIVE",
    "Shopping",
    "Brands",
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text("discover"),
          bottom: TabBar(
              splashFactory: NoSplash.splashFactory, //번지는 에니메이션효과 제거
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size16,
              ),
              isScrollable: true, //탭바가 길면 스크롤 가능
              unselectedLabelColor: Colors.grey.shade500, //선택되지 않은 탭 색상
              labelColor: Colors.black, //선택한 탭 색상
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Sizes.size16,
              ),
              indicatorColor: Colors.black,
              tabs: [for (var tab in tabs) Tab(text: tab)]),
        ),
        body: TabBarView(children: [
          for (var tab in tabs)
            Center(
              child: Text(
                tab,
                style: const TextStyle(
                  fontSize: 28,
                ),
              ),
            )
        ]),
      ),
    );
  }
}
