enum CustomerMemberType {
  TYPE1('타입1'),
  TYPE2("타입2"),
  TYPE3("타입3");

  final String desc;
  const CustomerMemberType(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory CustomerMemberType.fromString(String str) {
    return CustomerMemberType.values
        .firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
