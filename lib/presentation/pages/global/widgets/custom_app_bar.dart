import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final Widget title;
  final Widget action;

  CustomAppBar({Key? key, required this.title, required this.action})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(title: title, centerTitle: true, actions: [action]);
  }
}
