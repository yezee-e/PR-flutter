import 'package:flutter/material.dart';
import 'package:webtoon/screens/detail_screen.dart';
import 'package:webtoon/widgets/cardimage_weidget.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon(
      {super.key, required this.title, required this.thumb, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          //페이지전환함수-유저가 다른 페이지로 왔다고 느끼게 해줄수있음
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: CardImage(
              thumb: thumb,
              id: id,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
