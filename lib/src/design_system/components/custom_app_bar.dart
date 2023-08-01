// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lista_compras/src/design_system/colors/colors_app.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final double? elevation;
  final Color background;
  final Widget? leading;
  final Widget? trailing;
  final Color? titleColor;
  const CustomAppBar({
    Key? key,
    this.title,
    this.elevation,
    required this.background,
    this.leading,
    this.trailing,
    this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: background,
      leading: leading,
      actions: <Widget>[
        trailing ?? const SizedBox(),
      ],
      elevation: elevation,
      title: Text(
        title ?? 'Title',
        style: TextStyle(
          color: titleColor ?? AppColors.white,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
