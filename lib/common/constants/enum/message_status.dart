enum MessageStatus {
  StatusA("상태 A"),
  StatusB("상태 B"),
  StatusC("상태 C");

  final String desc;
  const MessageStatus(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory MessageStatus.fromString(String str) {
    return MessageStatus.values
        .firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
