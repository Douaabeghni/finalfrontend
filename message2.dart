import 'package:flutter/material.dart';
class Message2 {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  const Message2({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}