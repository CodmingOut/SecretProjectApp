import 'dart:convert';

import 'package:flutter/material.dart';

class VirusUnit {
  final String _sender;
  final String _fileName;
  final String _mailTitle;
  final String _mailContent;
  final int _timestamp;

  String get sender => _sender;
  String get fileName => _fileName;
  String get mailTitle => _mailTitle;
  String get mailContent => _mailContent;
  int get timestamp => _timestamp;
  DateTime get time => DateTime.fromMicrosecondsSinceEpoch(_timestamp * 1000);

  VirusUnit({
    @required String sender,
    @required String fileName,
    @required String mailTitle,
    @required String mailContent,
    @required int timestamp
  })
  : assert(sender != null),
    assert(fileName != null),
    assert(mailTitle != null),
    assert(mailContent != null),
    assert(timestamp != null),
    this._sender = sender,
    this._fileName = fileName,
    this._mailTitle = mailTitle,
    this._mailContent = mailContent,
    this._timestamp = timestamp;

  factory VirusUnit.fromJsonString(String jsonString) {
    return VirusUnit.fromJson(jsonDecode(jsonString));
  }

  factory VirusUnit.fromJson(dynamic json) {
    String sender = json['sender'];
    String fileName = json['fileName'];
    String mailTitle = json['mailTitle'];
    String mailContent = json['mailContent'];
    int timestamp = json['timestamp'];

    return VirusUnit(sender: sender, fileName: fileName, mailTitle: mailTitle, mailContent: mailContent, timestamp: timestamp);
  }
}