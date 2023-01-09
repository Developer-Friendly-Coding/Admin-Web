import 'package:clean_arch/common/constants/enum/contract_type.dart';
import 'package:clean_arch/common/constants/enum/tax_bill_status.dart';
import 'package:clean_arch/model/base_model.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class TaxBill implements Base {
  int _id;
  ContractInTaxBill _contract;
  DateTime? _issuedDate;
  double? _subTotal;
  double? _tax;
  double? _total;
  TaxBillStatus? _status;

  TaxBill(
      {int id = -1,
      ContractInTaxBill? contract,
      DateTime? issuedDate,
      double? subTotal,
      double? tax,
      double? total,
      TaxBillStatus? status})
      : _id = id,
        _contract = contract ?? ContractInTaxBill(),
        _issuedDate = issuedDate,
        _subTotal = subTotal,
        _tax = tax,
        _total = total,
        _status = status;
  @override
  TaxBill getDummy() {
    return TaxBill();
  }

  @override
  TaxBill fromJson(Map<String, dynamic> data) {
    return TaxBill(
        id: data['id'],
        contract: ContractInTaxBill.fromJson(data['contract']),
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
  Map<String, dynamic> toJsonForCreate(TaxBill taxBill) {
    TaxBillStatus status = taxBill.getMember("status");
    Map<String, dynamic> json = {
      'contractId': taxBill.getMember("contractId"),
      'issuedDate': DateFormat("yyyy-MM-dd hh:mm:ss")
          .format(taxBill.getMember("issuedDate")),
      "subTotal": taxBill.getMember("subTotal"),
      'tax': taxBill.getMember("tax"),
      'total': taxBill.getMember("total"),
      'status': status.name,
    };

    return json;
  }

  @override
  Map<String, dynamic> toJsonForUpdate(TaxBill taxBill) {
    TaxBillStatus status = taxBill.getMember("status");
    Map<String, dynamic> json = {
      'contractId': taxBill.getMember("contractId"),
      'issuedDate': DateFormat("yyyy-MM-dd hh:mm:ss")
          .format(taxBill.getMember("issuedDate")),
      "subTotal": taxBill.getMember("subTotal"),
      'tax': taxBill.getMember("tax"),
      'total': taxBill.getMember("total"),
      'status': status.name,
    };

    return json;
  }

  @override
  List<String?> toRow() {
    return [
      _id.toString(),
      _contract.description.toString(),
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
      case "contract":
        return _contract;
      case "contractId":
        return _contract.id;

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
  void setMember(String member, dynamic value) {
    switch (member) {
      case "id":
        _id = value;
        break;
      case "contract":
        _contract = value;
        break;
      case "contractId":
        _contract.id = value;
        break;
      case "issuedDate":
        _issuedDate = DateTime.parse(value);

        break;
      case "subTotal":
        _subTotal = double.parse(value);
        break;
      case "tax":
        _tax = double.parse(value);
        break;
      case "total":
        _total = double.parse(value);
        break;
      case "status":
        _status = TaxBillStatus.fromString(value);
        break;

      default:
    }
  }
}

class ContractInTaxBill {
  int id;
  double deposit;
  double rent;
  String? description;
  DateTime? contractDatetime;
  DateTime? startDatetime;
  DateTime? endDatetime;
  ContractType? type;

  ContractInTaxBill({
    int id = -1,
    double deposit = -1.0,
    double rent = -1.0,
    String? description = "",
    DateTime? contractDatetime,
    DateTime? startDatetime,
    DateTime? endDatetime,
    ContractType? type,
  })  : id = id,
        deposit = deposit,
        rent = rent,
        description = description,
        contractDatetime = contractDatetime,
        startDatetime = startDatetime,
        endDatetime = endDatetime,
        type = type;

  factory ContractInTaxBill.fromJson(Map<String, dynamic> data) {
    return ContractInTaxBill(
        id: data['id'],
        deposit: data['deposit'],
        rent: data['rent'],
        description: data['description'],
        contractDatetime: data['contractDatetime'] == null
            ? null
            : DateTime.parse(data['contractDatetime']),
        startDatetime: data['startDatetime'] == null
            ? null
            : DateTime.parse(data['startDatetime']),
        endDatetime: data['endDatetime'] == null
            ? null
            : DateTime.parse(data['endDatetime']),
        type: data['type'] == null
            ? null
            : ContractType.values.byName(data['type']));
  }
}
