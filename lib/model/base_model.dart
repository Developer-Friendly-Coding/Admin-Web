import 'package:flutter/material.dart';

abstract class Base {
  Base getDummy();
  Base fromJson(Map<String, dynamic> data);
  Map<String, dynamic> toJsonForCreate(covariant Base base);
  Map<String, dynamic> toJsonForUpdate(covariant Base base);
  List<String?> toRow();
  dynamic getMember(String member);
  void setMember(String member, dynamic value);
}
