// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Message {
  String? message;
  DateTime? timestamp;
  bool? isAI;
  Message({
    this.message,
    this.timestamp,
    this.isAI,
  });

  Message copyWith({
    String? message,
    DateTime? timestamp,
    bool? isAI,
  }) {
    return Message(
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
      isAI: isAI ?? this.isAI,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'timestamp': timestamp?.millisecondsSinceEpoch,
      'isAI': isAI,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      message: map['message'] != null ? map['message'] as String : null,
      // timestamp: map['timestamp'] != null
      //     ? DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int)
      //     : null,
      isAI: map['isAI'] != null ? map['isAI'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Message(message: $message, timestamp: $timestamp, isAI: $isAI)';

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.timestamp == timestamp &&
        other.isAI == isAI;
  }

  @override
  int get hashCode => message.hashCode ^ timestamp.hashCode ^ isAI.hashCode;
}
