import 'package:clean_arch/common/constants/enum/tax_bill_status.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class TaxBill implements Base {
  final int _id;
  final int _contractId;
  final DateTime? _issuedDate;
  final double? _subTotal;
  final double? _tax;
  final double? _total;
  final TaxBillStatus? _status;

  TaxBill(
      {int id = -1,
      int contractId = -1,
      DateTime? issuedDate,
      double? subTotal,
      double? tax,
      double? total,
      TaxBillStatus? status})
      : _id = id,
        _contractId = contractId,
        _issuedDate = issuedDate,
        _subTotal = subTotal,
        _tax = tax,
        _total = total,
        _status = status;

  @override
  TaxBill fromJson(Map<String, dynamic> data) {
    return TaxBill(
        id: data['id'],
        contractId: data['contractId'],
        issuedDate: data['issuedDate'] == null
            ? null
            : DateTime.parse(data['issuedDate']),
        subTotal: data['subTotal'],
        tax: data['tax'],
        total: data['total'],
        status: data['status'] == null
            ? null
            : TaxBillStatus.values.byName(data['status']));
  }

  @override
  TaxBill fromTEC(List<TextEditingController> list) {
    return TaxBill(
        id: list[0].text == "" ? -1 : int.parse(list[0].text),
        contractId: int.parse(list[1].text),
        issuedDate: list[2].text == "" ? null : DateTime.parse(list[2].text),
        subTotal: list[3].text == "" ? null : double.parse(list[3].text),
        tax: list[4].text == "" ? null : double.parse(list[4].text),
        total: list[5].text == "" ? null : double.parse(list[5].text),
        status:
            list[6].text == "" ? null : TaxBillStatus.fromString(list[6].text));
  }

  @override
  Map<String, dynamic> toJson(TaxBill taxBill) {
    Map<String, dynamic> json = {
      'contractId': taxBill._contractId,
      'issuedDate': (taxBill._issuedDate == null)
          ? null
          : DateFormat("yyyy-MM-dd hh:mm:ss").format(taxBill._issuedDate!),
      "subTotal": taxBill._subTotal,
      'tax': taxBill._tax,
      'total': taxBill._total,
      'status': taxBill._status?.name,
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _contractId.toString(),
      _issuedDate == null
          ? null.toString()
          : DateFormat('yyyy-MM-dd').format(_issuedDate!),
      _subTotal.toString(),
      _tax.toString(),
      _total.toString(),
      _status.toString()
    ];
  }

  @override
  dynamic getMember(String member) {
    switch (member) {
      case "id":
        return _id;
      case "contractId":
        return _contractId;
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
}
