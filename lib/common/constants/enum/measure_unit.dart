enum MeasureUnit {
  FAHRENHEIT('화씨'),
  PERCENT("퍼센트"),
  CM("센치미터"),
  CELSIUS('섭씨');

  final String desc;
  const MeasureUnit(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory MeasureUnit.fromString(String str) {
    return MeasureUnit.values
        .firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
