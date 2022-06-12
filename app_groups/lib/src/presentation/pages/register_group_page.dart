import 'package:common_deps/common_deps.dart';
import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../controllers/controllers.dart';

class RegisterGroupPage extends StatefulWidget {
  const RegisterGroupPage({ Key? key }) : super(key: key);

  @override
  State<RegisterGroupPage> createState() => _RegisterGroupPageState();
}

class _RegisterGroupPageState extends State<RegisterGroupPage> {
  final controller = GetIt.instance<RegisterGroupController>();

  @override
  Widget build(BuildContext context) {
    return BasePageWidget(
      title: 'Cadastrar grupo',
      onError: (String message) {  
        showDialog(context: context, builder: (context) => ErrorDialog(message: message));
      },
      onSuccess: (String message) { 
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: AppColors.purple ,
          content: Text(message),
        ));
        Navigator.pop(context);
      },
      state: controller.state,
      children: [
        Column(
          children: [
            const HeaderSection(title: 'Novo Grupo'),
            const SizedBox(height: Spacing.x4),
            form(),
          ],
        ),
        AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return SecondaryButton(title: 'Salvar', onTap: controller.saveGroup);
          }
        )
      ],
    );
  }

  Widget form() => Column(
    children: [
      Input(
        label: 'Nome', 
        hint: 'Nome do grupo',
        error: false, 
        errorText: '', 
        onChanged: (String v) {
          controller.setGroupEntity(controller.groupEntity.copy(name: v)); 
        }, 
      )
    ]
  );
}