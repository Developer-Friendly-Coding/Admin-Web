enum TaxBillStatus {
  LOADING('진행중'),
  NO("발행되지 않음"),
  YES("발행");

  final String desc;
  const TaxBillStatus(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory TaxBillStatus.fromString(String str) {
    return TaxBillStatus.values
        .firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
