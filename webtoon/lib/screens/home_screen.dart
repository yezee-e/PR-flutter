import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_model.dart';
import 'package:webtoon/services/api_service.dart';
import 'package:webtoon/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot))
              ],
            );
          }

          return const Center(
            child: CircularProgressIndicator(), //로딩처리
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      //Listview
      //인덱스를 통해 어떤 아이템이 build 되는지 알수있다
      //사용자가 보고 있는 아이템만 build해줄수있다(모든 아이템을 한번에 로드하지 않기때문에 메모리 효율을 높여준다)
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        //itemBuilder
        //ListView의 아이템을 만드는 역할을 한다

        var webtoon = snapshot.data![index];

        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      //separatorBuilder
      //(margin이나 padding없이)아이템 사이에 구분자를 넣어주는 builder
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
