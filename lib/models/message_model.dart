// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chatt_app/constants.dart';

class Message {
  final String message;
  Message(this.message);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessage]);
  }
}
