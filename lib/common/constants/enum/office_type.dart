enum OfficeType {
  OPEN_DESK("오픈데스크"),
  DESK_2("2인데스크"),
  PRIVATE_OFFICE("프라이빗오피스"),
  NOTSTAY_OFFICE("비상주오피스"),
  PRIVATE_DESK("전용데스크"),
  ROOM_2("2인실"),
  FIXED_DESK("고정석"),
  VIRTUAL_OFFICE("가상오피스"),
  CONFERENCE_ROOM("회의실"),
  LOUNGE_DESK("라운지데스크");

  final String desc;
  const OfficeType(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory OfficeType.fromString(String str) {
    return OfficeType.values.firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
