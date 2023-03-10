enum SensorType {
  LUMINOSITY('광도 센서'),
  THERMOHYGROMETER("온습도계"),
  TEMPERATUREANDHUMIDITY("온습도 센서");

  final String desc;
  const SensorType(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory SensorType.fromString(String str) {
    return SensorType.values.firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
