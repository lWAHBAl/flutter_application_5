import 'package:flutter/material.dart';

class Request {
  final int senderId;
  final int receiverId;
  final List<String> request;

  Request({
    required this.senderId,
    required this.receiverId,
    required this.request,
  });

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      senderId: json['sender_id'],
      receiverId: json['receiver_id'],
      request: json['data'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sender_id': senderId,
      'receiver_id': receiverId,
      'data': request,
    };
  }
}
