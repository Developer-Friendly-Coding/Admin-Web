enum ContractType {
  CONFERENCE("회의실"),
  ELSE("나머지"),
  GENERAL("일반");

  final String desc;
  const ContractType(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory ContractType.fromString(String str) {
    return ContractType.values
        .firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
