import 'package:flutter/material.dart';

abstract class Base {
  Base fromJson(Map<String, dynamic> data);
  Map<String, dynamic> toJson(covariant Base base);
  List<String?> toRow();
  Base fromTEC(List<TextEditingController> list);
  dynamic getMember(String member);
}
