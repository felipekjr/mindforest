import 'package:app_chat/src/domain/helpers/helpers.dart';
import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../controllers/controllers.dart';
import '../../controllers/states/states.dart';
import '../widgets/widgets.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final controller = GetIt.I<ChatController>();
  final TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    controller.init();
    controller.state.addListener(() {
      final state = controller.state.value;
      if (state is UIErrorState) {
        showDialog(
            context: context,
            builder: (context) => ErrorDialog(message: state.description));
      }
      if (state is UISuccessState) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.purple,
          content: Text(state.description),
        ));
        Navigator.pop(context);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.closeNotifiers();
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
          messages(),
          actionSection(),
          const SizedBox(height: Spacing.x3),
        ],
      ),
    );
  }

  AnimatedBuilder actionSection() {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        if (controller.currentQuestionIndex == 1) {
          return _buildUserInput();
        }
        if (controller.state.value is LoadingMessageState || controller.state.value is UIInitialState) {
          return actions(controller.isActionsEnabled(controller.state.value));
        }
        return button();
      },
    );
  }

  Widget _buildTextField() {
    return Flexible(
      child: TextField(
        controller: inputController,
        onChanged: (String v) => inputController.text = v,
        decoration: InputDecoration.collapsed(
          hintText: "Código do grupo",
        ),
      ),
    );
  }

  // Botão para enviar a mensagem
  Widget _buildSendButton() {
    return Container(
      margin: const EdgeInsets.only(left: 8.0),
      child: PrimaryButton(
        onTap: () {
          if (inputController.text.isNotEmpty) {
            controller.replyGroupToken(inputController.text);
          } else {
            controller.nextQuestion();
            controller.notifyListeners();
          }
        },
        title: 'Enviar'
      ),
    );
  }

  // Monta uma linha com o campo de text e o botão de enviao
  Widget _buildUserInput() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          _buildTextField(),
          _buildSendButton(),
        ],
      ),
    );
  }

  Widget button() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.x3),
      child: PrimaryButton(
        title: 'Regar',
        onTap: controller.sendForm,
      ),
    );
  }

  Widget messages() {
    return Flexible(
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return ListView.builder(
            controller: controller.messagesScrollController,
            padding: const EdgeInsets.all(8.0),
            itemBuilder: (_, int index) {
              return MessageListItem(
                key: Key('message_$index'),
                chatMessage: controller.messages[index],
                loading: controller.state.value is LoadingMessageState &&
                    index == controller.messages.length - 1,
              );
            },
            itemCount: controller.messages.length,
          );
        },
      ),
    );
  }

  Widget actions(bool enabled) {
    final disabled = !enabled;
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
          EmojiButton(
            'assets/happy.png',
            onTap: () {
              controller.reply(AnswerValues.never);
            },
            disabled: disabled,
          ),
          EmojiButton(
            'assets/neutral.png',
            onTap: () {
              controller.reply(AnswerValues.someDays);
            },
            disabled: disabled,
          ),
          EmojiButton(
            'assets/confused.png',
            onTap: () {
              controller.reply(AnswerValues.severalDays);
            },
            disabled: disabled,
          ),
          EmojiButton(
            'assets/downface.png',
            onTap: () {
              controller.reply(AnswerValues.almostEveryday);
            },
            disabled: disabled,
          ),
        ],
      ),
    );
  }
}

class EmojiButton extends StatelessWidget {
  final String path;
  final VoidCallback onTap;
  final bool disabled;

  const EmojiButton(this.path, {required this.onTap, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: disabled ? .5 : 1,
      child: InkWell(
        onTap: disabled ? null : onTap,
        child: Image.asset(
          path,
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
