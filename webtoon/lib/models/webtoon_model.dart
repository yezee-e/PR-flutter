class WebtoonModel {
  final String title, thumb, id;

//named constructor
//constructor의 인수만 적어주고, property를 적어주면 초기화할 수 있어서 편리

  WebtoonModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        thumb = json["thumb"],
        id = json["id"];
}
