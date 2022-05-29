import 'package:flutter/foundation.dart';

class Visitor {
  String name;
  String date;
  String time;
  String visitorType;
  String flatDetails;
  bool status;

  Visitor({
    required this.name,
    required this.date,
    required this.time,
    required this.visitorType,
    required this.flatDetails,
    required this.status,
  });
}
