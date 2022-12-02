enum EmployeeType {
  REGULAR('정규직'),
  IRREGULAR("비정규직"),
  PARTTIME("파트 타임");

  final String desc;
  const EmployeeType(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory EmployeeType.fromString(String str) {
    return EmployeeType.values
        .firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
