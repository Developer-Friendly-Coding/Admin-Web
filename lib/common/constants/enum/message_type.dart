enum MessageType {
  TypeA("타입 A"),
  TypeB("타입 B"),
  TypeC("타입 C");

  final String desc;
  const MessageType(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory MessageType.fromString(String str) {
    return MessageType.values
        .firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
