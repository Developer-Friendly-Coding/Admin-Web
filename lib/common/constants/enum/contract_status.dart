enum ContractStatus {
  CONFIRMED("체결"),
  DRAFT("초안"),
  EXPIRED("만료");

  final String desc;
  const ContractStatus(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory ContractStatus.fromString(String str) {
    return ContractStatus.values
        .firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
