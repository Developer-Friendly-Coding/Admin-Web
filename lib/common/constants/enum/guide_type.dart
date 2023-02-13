enum GuideType {
  PRINT('print'),
  WIFI("wifi"),
  TOILET("toilet");

  final String desc;
  const GuideType(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory GuideType.fromString(String str) {
    return GuideType.values.firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
