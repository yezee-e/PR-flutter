import 'dart:convert';

import 'package:http/http.dart' as http;
//as 키워드를 사용하여 import된 패키지의 이름을 변경할 수 있습니다.
//이것은 다른 패키지나 라이브러리와 충돌이 발생할 수 있는 경우에 유용
import 'package:webtoon/models/webtoon_detail_model.dart';
import 'package:webtoon/models/webtoon_episode_model.dart';
import 'package:webtoon/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";

  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse("$baseUrl/$today");
    final response = await http.get(url);
    //api에 http요청을 보냄
    //http.get은 future이라는 타입을 반환 ->작업이 마무리되면 response라는 타입을 반환

    if (response.statusCode == 200) {
      final List<dynamic> webtoons =
          jsonDecode(response.body); //string을 Json형식으로 변환
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
        //fromJson이라는 named constructor을 사용해서 webtoonModel을 만들어준다
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id"); //URL을 생성
    final response = await http.get(url); //생성한 URL을 사용하여 http get요청을 보냄

    if (response.statusCode == 200) {
      final webtoon = jsonDecode(
          response.body); //http응답에서 받은 데이터를 JSON형식으로 디코딩하여 "Webtoon"변수에 저장
      return WebtoonDetailModel.fromJson(webtoon); //객체로 변환하여 반환
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];

    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
