import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
import 'package:flutter/material.dart';

import '../../controllers/controllers.dart';
import '../widgets/widgets.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final controller = GetIt.I<ChatController>();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: CustomAppBar(
          title: 'Chat',
          color: AppColors.primary,
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildList(),
              Divider(
                height: 1.0,
                color: AppColors.grey,
              ),
              
              actions(),
              const SizedBox(
                height: Spacing.x3,
              ),
            ]));
  }

  Widget button() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: Spacing.x6),
    child: PrimaryButton(title: 'Enviar', onTap: () {}),
  );

  Widget _buildList() {
    return Flexible(
      child: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemBuilder: (_, int index) =>
            MessageListItem(chatMessage: controller.messages[index]),
        itemCount: controller.messages.length,
      ),
    );
  }

  Widget actions() {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: Spacing.x1, horizontal: Spacing.x3),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(50)),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Wrap(
        spacing: Spacing.x3,
        children: [
          EmojiButton('assets/downface.png', onTap: () {}),
          EmojiButton('assets/confused.png', onTap: () {}),
          EmojiButton('assets/neutral.png', onTap: () {}),
          EmojiButton('assets/happy.png', onTap: () {}),
        ],
      ),
    );
  }
}

class EmojiButton extends StatelessWidget {
  final String path;
  final VoidCallback onTap;

  const EmojiButton(this.path, {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        path,
        width: 50,
        height: 50,
      ),
    );
  }
}


