import 'package:flutter/material.dart';
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';
import 'package:webtoon/services/api_service.dart';
import 'package:webtoon/widgets/cardimage_weidget.dart';

class DetailScreen extends StatefulWidget {
  final String title, thumb, id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<WebtoonDetailModel> webtoon;
  late Future<List<WebtoonEpisodeModel>> episode;

  @override
  void initState() {
    super.initState();
    webtoon = ApiService.getToonById(widget.id);
    episode = ApiService.getLatestEpisodesById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: Column(children: [
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: widget.id,
              child: CardImage(
                thumb: widget.thumb,
                id: widget.id,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        FutureBuilder(
          future: webtoon,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snapshot.data!.about,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${snapshot.data!.genre}/${snapshot.data!.age}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              );
            }
            return const Text("...");
          },
        ),
      ]),
    );
  }
}
