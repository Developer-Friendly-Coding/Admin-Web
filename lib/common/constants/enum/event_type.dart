enum EventType {
  EVENT1('이벤트1'),
  EVENT2("이벤트2"),
  EVENT3("이벤트3");

  final String desc;
  const EventType(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory EventType.fromString(String str) {
    return EventType.values.firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
