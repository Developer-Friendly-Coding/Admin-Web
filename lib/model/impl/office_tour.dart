// import 'package:clean_arch/model/base_model.dart';
// import 'package:clean_arch/model/sub_model/customer_member_sub.dart';
// import 'package:clean_arch/model/sub_model/officeBranch_sub.dart';
// import 'package:intl/intl.dart';

// class OfficeTour implements Base {
//   int _id; //
//   DateTime? _startDatetime;
//   DateTime? _endDatetime;
//   CustomerMemberSub _customerMember; //
//   OfficeBranchSub _branch;
//   String? _description; //

//   OfficeTour({
//     required int id,
//     DateTime? startDatetime,
//     DateTime? endDatetime,
//     required CustomerMemberSub customerMember,
//     required OfficeBranchSub branch,
//     String? description,
//   })  : _id = id,
//         _startDatetime = startDatetime,
//         _endDatetime = endDatetime,
//         _customerMember = customerMember,
//         _branch = branch,
//         _description = description;

//   factory OfficeTour.fromJson(Map<String, dynamic> data) {
//     return OfficeTour(
//       id: data['id'],
//       startDatetime: data['startDatetime'] == null
//           ? null
//           : DateTime.tryParse(data['startDatetime']),
//       endDatetime: data['endDatetime'] == null
//           ? null
//           : DateTime.tryParse(data['endDatetime']),
//       customerMember: CustomerMemberSub.fromJson(data['customerMember']),
//       branch: OfficeBranchSub.fromJson(data['branch']),
//       description: data['description'],
//     );
//   }

//   @override
//   Map<String, dynamic> toJsonForCreate() {
//     Map<String, dynamic> json = {
//       'startDatetime': _startDatetime == null
//           ? null
//           : DateFormat("yyyy-MM-dd hh:mm:ss").format(_startDatetime!),
//       'endDatetime': _endDatetime == null
//           ? null
//           : DateFormat("yyyy-MM-dd hh:mm:ss").format(_endDatetime!),
//       'customerMemberId': _customerMember.id,
//       'branchId': _branch.id,
//       'description': _description,
//     };
//     return json;
//   }

//   @override
//   Map<String, dynamic> toJsonForUpdate() {
//     Map<String, dynamic> json = {
//       'startDatetime': _startDatetime == null
//           ? null
//           : DateFormat("yyyy-MM-dd hh:mm:ss").format(_startDatetime!),
//       'endDatetime': _endDatetime == null
//           ? null
//           : DateFormat("yyyy-MM-dd hh:mm:ss").format(_endDatetime!),
//       'customerMemberId': _customerMember.id,
//       'branchId': _branch.id,
//       'description': _description,
//     };
//     return json;
//   }

//   @override
//   List<String> toRow() {
//     return [
//       _id.toString(),
//       _startDatetime == null
//           ? "없음"
//           : DateFormat('yyyy-MM-dd').format(_startDatetime!),
//       _endDatetime == null
//           ? "없음"
//           : DateFormat('yyyy-MM-dd').format(_endDatetime!),
//       _customerMember.name,
//       _branch.name,
//       _description ?? "없음",
//     ];
//   }

//   @override
//   dynamic getMember(String member) {
//     switch (member) {
//       case "id":
//         return _id;
//       case "startDatetime":
//         return _startDatetime;
//       case "endDatetime":
//         return _endDatetime;
//       case "customerMemberId":
//         return _customerMember.id;
//       case "customerMemberName":
//         return _customerMember.name;
//       case "branchId":
//         return _branch.id;
//       case "branchName":
//         return _branch.name;
//       case "description":
//         return _description;
//       default:
//     }
//   }

//   @override
//   void setMemberByText(String member, String text) {
//     switch (member) {
//       case "startDatetime":
//         _startDatetime = (text == "") ? null : DateTime.parse(text);
//         break;
//       case "endDatetime":
//         _endDatetime = (text == "") ? null : DateTime.parse(text);
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
//       case "customerMemberId":
//         _customerMember.id = id;
//         break;
//       case "branchId":
//         _branch.id = id;
//         break;
//       default:
//     }
//   }
// }
