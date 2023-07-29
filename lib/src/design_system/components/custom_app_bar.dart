import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color background;
  final Widget? leading;
  final Widget? trailing;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.background,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: background,
      leading: leading,
      actions: <Widget>[
        trailing ?? const SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
