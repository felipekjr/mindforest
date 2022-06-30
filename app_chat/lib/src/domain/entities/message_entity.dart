enum MessageType { sent, received }

class MessageEntity {
  final String name;
  final String text;
  final MessageType type;

  MessageEntity({
    required this.name,
    required this.text,
    this.type = MessageType.sent,
  });
}