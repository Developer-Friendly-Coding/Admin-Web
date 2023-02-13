enum CustomerMemberStatus {
  EXPIRE('만료'),
  NOTHING("테스트"),
  ON("계약중");

  final String desc;
  const CustomerMemberStatus(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory CustomerMemberStatus.fromString(String str) {
    return CustomerMemberStatus.values
        .firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
