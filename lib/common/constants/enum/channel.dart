enum Channel {
  Achannel("채널 A"),
  Bchannel("채널 B"),
  Cchannel("채널 C");

  final String desc;
  const Channel(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory Channel.fromString(String str) {
    return Channel.values.firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
