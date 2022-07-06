import 'package:common_deps/common_deps.dart';

enum MessageType { sent, received }

class MessageEntity extends Equatable {
  final int? index;
  final String name;
  final String text;
  final MessageType type;

  const MessageEntity({
    required this.name,
    required this.text,
    this.type = MessageType.sent,
    this.index,
  });

  @override
  List<Object?> get props => [index, name, text, type];
}