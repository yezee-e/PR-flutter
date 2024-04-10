class WebtoonDetailModel {
  final String title, about, genre, age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        about = json["about"],
        genre = json["genre"],
        age = json["age"];
}

//데이터모델링- 데이터의 구조와 속성을 명확하게 정의
//코드응집성- 데이터와 관련된 로직을 하나의 단일 클래스로 묶어준다
//JSON파싱- 주로 외부 api는 JSON형식으로 데이터를 받아온다, 이때 json데이터를 model클래스로 변환하여 사용하면 데이터의 구조를 명확히 알수있고,json파싱 작업을 간편하게 가능
//타입안정성- 데이터 타입을 명시적으로 지정해서 코드에서 발생할수있는 타입관련 오류를 사전에 방지
//유지보수성- 데이터구조가 변경되거나 추가될 경우, Model클래스만 수정하면 되므로 코드 유지보수성 향상
