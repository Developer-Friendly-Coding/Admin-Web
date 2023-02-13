enum DeepLinkTarget {
  DeepLinkTargetA("딥링크 A"),
  DeepLinkTargetB("딥링크 B"),
  DeepLinkTargetC("딥링크 C");

  final String desc;
  const DeepLinkTarget(this.desc); // 이넘생성자 blabla("desc") 꼴임

//String -> enum
  factory DeepLinkTarget.fromString(String str) {
    return DeepLinkTarget.values
        .firstWhere((element) => element.toString() == str);
  }
  //print() 하거나 toString 하면 desc리턴
  @override
  String toString() {
    return desc;
  }
}
