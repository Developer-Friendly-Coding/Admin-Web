enum BusinessType {
  PERSONAL("개인사업자"),
  CORPORATION("법인사업자"),
  INDIVIDUAL("개인이용");

  final String desc;
  const BusinessType(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory BusinessType.fromString(String str) {
    return BusinessType.values
        .firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
