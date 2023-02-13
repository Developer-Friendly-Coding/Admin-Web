abstract class Base {
  Map<String, dynamic> toJsonForCreate();
  Map<String, dynamic> toJsonForUpdate();
  List<String> toRow();
  dynamic getMember(String member);
  void setMemberById(String member, int id);
  void setMemberByText(String member, String text);
}
