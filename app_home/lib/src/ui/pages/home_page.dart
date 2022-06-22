import 'package:app_home/src/controllers/home_controller.dart';
import 'package:common_deps/common_deps.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';

class HomePage extends ConsumerWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.read(homeProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            
          ],
        )
      ),
    );
  }
}