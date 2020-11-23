import 'dart:convert';

import 'package:flutter/material.dart';

class VirusUnit {
  final String _sender;
  final String _fileName;
  final String _mailTitle;
  final String _mailContent;
  final String _timestamp;

  String get sender => _sender;
  String get fileName => _fileName;
  String get mailTitle => _mailTitle;
  String get mailContent => _mailContent;
  String get timestamp => _timestamp;

  VirusUnit({
    @required String sender,
    @required String fileName,
    String mailTitle,
    String mailContent,
    @required String timestamp
  })
  : assert(sender != null),
    assert(fileName != null),
    assert(timestamp != null),
    this._sender = sender,
    this._fileName = fileName,
    this._mailTitle = mailTitle ?? '',
    this._mailContent = mailContent ?? '',
    this._timestamp = timestamp;

  factory VirusUnit.fromJsonString(String jsonString) {
    return VirusUnit.fromJson(jsonDecode(jsonString));
  }

  factory VirusUnit.fromJson(dynamic json) {
    String sender = json['sender'];
    String fileName = json['fileName'];
    String mailTitle = json['mailTitle'];
    String mailContent = json['mailContent'];
    String timestamp = json['timestamp'];

    return VirusUnit(sender: sender, fileName: fileName, mailTitle: mailTitle, mailContent: mailContent, timestamp: timestamp);
  }
}