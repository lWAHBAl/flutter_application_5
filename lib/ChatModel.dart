import 'package:flutter/material.dart';

class Message {
  final String message;
  final int id;
  final DateTime time;

  Message({
    required this.message,
    required this.id,
    required this.time,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      message: json['message'],
      id: json['id'],
      time: DateTime.parse(json['time']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'id': id,
      'time': time.toIso8601String(),
    };
  }
}
