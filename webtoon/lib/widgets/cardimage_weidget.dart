// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String thumb, id;
  const CardImage({Key? key, required this.thumb, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
            blurRadius: 15,
            offset: const Offset(10, 10),
            color: Colors.black.withOpacity(0.5)),
      ]),
      width: 250,
      child: Image.network(
        thumb,
        headers: const {
          'Referer': 'https://comic.naver.com',
        },
      ),
    );
  }
}
