// import 'package:clean_arch/common/constants/enum/office_type.dart';
// import 'package:clean_arch/model/base_model.dart';
// import 'package:clean_arch/model/sub_model/officeBranch_sub.dart';

// class Post implements Base {
//   int _id; //
//   OfficeType _type;
//   int _capacity; //
//   String? _description;
//   String _name; //
//   OfficeBranchSub _officeBranch; //

//   Post({
//     required int id,
//     required OfficeBranchSub officeBranch,
//     required String name,
//     required OfficeType type,
//     required int capacity,
//     String? description,
//   })  : _id = id,
//         _type = type,
//         _capacity = capacity,
//         _description = description,
//         _name = name,
//         _officeBranch = officeBranch;

//   factory Post.fromJson(Map<String, dynamic> data) {
//     return Post(
//         id: data['id'],
//         type: OfficeType.values.byName(data['type']),
//         capacity: data['capacity'],
//         description: data['description'],
//         name: data['name'],
//         officeBranch: OfficeBranchSub.fromJson(data['officeBranch']));
//   }

//   @override
//   Map<String, dynamic> toJsonForCreate() {
//     Map<String, dynamic> json = {
//       'type': _type.name,
//       'capacity': _capacity,
//       'description': _description,
//       'name': _name,
//       'officeBranchId': _officeBranch.id,
//     };
//     return json;
//   }

//   @override
//   Map<String, dynamic> toJsonForUpdate() {
//     Map<String, dynamic> json = {
//       'type': _type.name,
//       'capacity': _capacity,
//       'description': _description,
//       'name': _name,
//       'officeBranchId': _officeBranch.id,
//     };
//     return json;
//   }

//   @override
//   List<String> toRow() {
//     return [
//       _id.toString(),
//       _officeBranch.name,
//       _name,
//       _capacity.toString(),
//       _type.toString(),
//       _description ?? "없음",
//     ];
//   }

//   @override
//   dynamic getMember(String member) {
//     switch (member) {
//       case "id":
//         return _id;
//       case "officeBranchId":
//         return _officeBranch.id;
//       case "officeBranchName":
//         return _officeBranch.name;
//       case "name":
//         return _name;
//       case "capacity":
//         return _capacity;
//       case "type":
//         return _type;
//       case "description":
//         return _description;

//       default:
//     }
//   }

//   @override
//   void setMemberByText(String member, String text) {
//     switch (member) {
//       // case "officeBranchrName":
//       //   _officeBranch.name = text;
//       //   break;
//       case "name":
//         _name = text;
//         break;
//       case "capacity":
//         _capacity = int.parse(text);
//         break;
//       case "type":
//         _type = OfficeType.fromString(text);
//         break;
//       case "description":
//         _description = (text == "") ? null : text;
//         break;
//       default:
//     }
//   }

//   @override
//   void setMemberById(String member, int id) {
//     switch (member) {
//       case "officeBranchId":
//         _officeBranch.id = id;
//         break;
//       default:
//     }
//   }
// }
