enum GateCredentialStatus {
  VALID("유효"),
  EXPIRED("만료");

  final String desc;
  const GateCredentialStatus(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory GateCredentialStatus.fromString(String str) {
    return GateCredentialStatus.values
        .firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
