import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
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
          title: const CupertinoSearchTextField(),
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
          GridView.builder(
            itemCount: 20,
            padding: const EdgeInsets.all(
              Sizes.size6,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 한 행에 몇 개의 아이템을 보여줄지 설정
                crossAxisSpacing: Sizes.size10, //grid사이에 공간을 얼마나 줄지
                mainAxisSpacing: Sizes.size10, //rid사이에 공간을 얼마나 줄지
                childAspectRatio: 9 / 20 //아이템상자의 비율
                ), //몇개의 column을 가질지 정함
            itemBuilder: (context, index) => Column(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.size4)),
                  child: AspectRatio(
                    aspectRatio: 9 / 15,
                    child: FadeInImage.assetNetwork(
                        fit: BoxFit.fill,
                        placeholder: 'assets/images/lemon.jpg',
                        image:
                            "https://source.unsplash.com/random/200x${355 + index}"),
                  ),
                ),
                Gaps.v10,
                const Text(
                  "this is a very long caption for my tictok that im upload just now currently",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Sizes.size16 + Sizes.size2,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v8,
                DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w600,
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundImage: AssetImage(
                          "assets/images/lemon.jpg",
                        ),
                      ),
                      Gaps.h4,
                      const Expanded(
                        child: Text(
                          "my avatar is going to be very long",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Gaps.h4,
                      FaIcon(
                        FontAwesomeIcons.heart,
                        size: Sizes.size16,
                        color: Colors.grey.shade600,
                      ),
                      Gaps.h2,
                      const Text(
                        "2.5M",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          for (var tab in tabs.skip(1))
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
