enum Job {
  Designer('디자이너'),
  DEVELOPER("개발자"),
  Marketer("마케터"),
  Manager('매니저'),
  Maker("메이커");

  final String desc;
  const Job(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory Job.fromString(String str) {
    return Job.values.firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
