import 'package:common_deps/common_deps.dart' as cd;
import 'package:common_ui/common_ui.dart';
import 'package:common_user/common_user.dart';
import 'package:flutter/material.dart';
import '../helpers/ui_state.dart';
import '../routes.dart';

class BasePageWidget extends StatefulWidget {
  final String? title;
  final List<Widget> children;
  final ValueNotifier<UIState> state;
  final Function(String) onError;
  final Function(String) onSuccess;

  const BasePageWidget({ 
    Key? key,
    this.title,
    required this.children,
    required this.state,
    required this.onError,
    required this.onSuccess
  }) : super(key: key);

  @override
  State<BasePageWidget> createState() => _BasePageWidgetState();
}

class _BasePageWidgetState extends State<BasePageWidget> {
  @override
  void initState() {
    widget.state.addListener(() {
      final state = widget.state.value;
      if (state is UIErrorState) widget.onError(state.description);
      if (state is UISuccessState) widget.onSuccess(state.description);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currRoute =  widget.title == 'Grupos';
    return Scaffold(
      appBar: widget.title != null ? CustomAppBar(
        title: widget.title!,
        hideLeading: currRoute,
        action: currRoute ? GestureDetector(onTap: () {
          cd.GetIt.I<UserSessionService>().signOut().then((value) => Navigator.pushReplacementNamed(context, Routes.login));
        }, child: Icon(Icons.exit_to_app, size: 24, color: AppColors.black,),) : null,
      ) : null,
      body: SingleChildScrollView(
        child: SafeArea(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height * .85),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: Spacing.x2,
                horizontal: Spacing.x3
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: widget.children
              ),
            ),
          ),
        ),
      )
    );
  }
}