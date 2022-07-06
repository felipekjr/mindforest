import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

class MessageListItem extends StatelessWidget {
  final MessageEntity chatMessage;
  final bool loading;

  const MessageListItem({Key? key, required this.chatMessage, this.loading = false}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return chatMessage.type == MessageType.sent
        ? _showSentMessage()
        : _showReceivedMessage();
  }

  Widget _showSentMessage() {
    return Padding(
      padding: const EdgeInsets.only(top: Spacing.x1),
      child: ListTile(
        contentPadding:
            const EdgeInsets.fromLTRB(Spacing.x6, 0.0, Spacing.x1, 0.0),
        trailing: CircleAvatar(
          child: Text(
            chatMessage.name.toUpperCase()[0],
            style: TextStyle(color: AppColors.white),
          ),
          backgroundColor: AppColors.secondary,
        ),
        title: Text(chatMessage.name, textAlign: TextAlign.right),
        subtitle: Text(chatMessage.text, textAlign: TextAlign.right),
      ),
    );
  }

  Widget _showReceivedMessage() {
    return Padding(
      padding: const EdgeInsets.only(top: Spacing.x1),
      child: ListTile(
        contentPadding:
            const EdgeInsets.fromLTRB(Spacing.x1, 0.0, Spacing.x6, 0.0),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.pink.withOpacity(.4),
            image: const DecorationImage(
              image: AssetImage(
                'assets/Avatar.png',
              ),
            ),
          ),
        ),
        title: Text(chatMessage.name, textAlign: TextAlign.left),
        subtitle: loading ? loadBubble() : Text(chatMessage.text, textAlign: TextAlign.left),
      ),
    );
  }

  Widget loadBubble() => Padding(
    padding: const EdgeInsets.only(right: Spacing.x12 * 2),
    child: Container(
      height: 30,
      padding: const EdgeInsets.all(Spacing.x1),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(50)
      ),
      child: CustomSpinner(color: AppColors.black,)
    ),
  );
}