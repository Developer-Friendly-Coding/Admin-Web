enum GateCredentialType {
  VISITOR('방문자'),
  TEMPORARY("임시발급"),
  CARD_KEY("카드키");

  final String desc;
  const GateCredentialType(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory GateCredentialType.fromString(String str) {
    return GateCredentialType.values
        .firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
