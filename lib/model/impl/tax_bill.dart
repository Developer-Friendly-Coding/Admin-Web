import 'package:clean_arch/common/constants/enum/tax_bill_status.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:clean_arch/model/sub_model/contract_sub.dart';
import 'package:intl/intl.dart';

class TaxBill implements Base {
  int _id;
  ContractSub _contract;
  DateTime? _issuedDate;
  double? _subTotal;
  double? _tax;
  double? _total;
  TaxBillStatus _status;

  TaxBill(
      {required int id,
      required ContractSub contract,
      DateTime? issuedDate,
      double? subTotal,
      double? tax,
      double? total,
      required TaxBillStatus status})
      : _id = id,
        _contract = contract,
        _issuedDate = issuedDate,
        _subTotal = subTotal,
        _tax = tax,
        _total = total,
        _status = status;

  @override
  factory TaxBill.fromJson(Map<String, dynamic> data) {
    return TaxBill(
        id: data['id'],
        contract: ContractSub.fromJson(data['contract']),
        issuedDate: data['issuedDate'] == null
            ? null
            : DateTime.tryParse(data['issuedDate']),
        subTotal: data['subTotal'],
        tax: data['tax'],
        total: data['total'],
        status: data['status'] = TaxBillStatus.values.byName(data['status']));
  }

  @override
  Map<String, dynamic> toJsonForCreate() {
    Map<String, dynamic> json = {
      'contractId': _contract.id,
      'issuedDate': _issuedDate == null
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(_issuedDate!),
      "subTotal": _subTotal,
      'tax': _tax,
      'total': _total,
      'status': _status.name,
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate() {
    Map<String, dynamic> json = {
      'contractId': _contract.id,
      'issuedDate': _issuedDate == null
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(_issuedDate!),
      "subTotal": _subTotal,
      'tax': _tax,
      'total': _total,
      'status': _status.name,
    };

    return json;
  }

  @override
  List<String> toRow() {
    return [
      _id.toString(),
      _contract.type.toString(),
      _issuedDate == null
          ? "없음"
          : DateFormat('yyyy-MM-dd').format(_issuedDate!),
      _subTotal == null ? "없음" : _subTotal.toString(),
      _tax == null ? "없음" : _tax.toString(),
      _total == null ? "없음" : _total.toString(),
      _status.toString(),
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "contractId":
        return _contract.id;
      case "contractDescription":
        return _contract.description;
      case "issuedDate":
        return _issuedDate;
      case "subTotal":
        return _subTotal;
      case "tax":
        return _tax;
      case "total":
        return _total;
      case "status":
        return _status;

      default:
    }
  }

  @override
  void setMemberByText(String member, String text) {
    switch (member) {
      case "issuedDate":
        _issuedDate = (text == "") ? null : DateTime.parse(text);
        break;
      case "subTotal":
        _subTotal = (text == "") ? null : double.parse(text);
        break;
      case "tax":
        _tax = (text == "") ? null : double.parse(text);
        break;
      case "total":
        _total = (text == "") ? null : double.parse(text);
        break;
      case "status":
        _status = TaxBillStatus.fromString(text);
        break;

      default:
    }
  }

  @override
  void setMemberById(String member, int id) {
    switch (member) {
      case "id":
        _id = id;
        break;
      case "contractId":
        _contract.id = id;
        break;
      default:
    }
  }
}
