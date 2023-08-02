// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lista_compras/src/design_system/colors/colors_app.dart';
import 'package:provider/provider.dart';
import '../../provider/text_field_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String Function()? titleCallback;
  final Consumer<TextFieldProvider>? titleProvider;
  final double? elevation;
  final Color background;
  final Widget? leading;
  final Widget? trailing;
  final Color? titleColor;
  const CustomAppBar({
    Key? key,
    this.titleCallback,
    this.elevation,
    required this.background,
    this.leading,
    this.trailing,
    this.titleColor,
    this.titleProvider,
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
      title: Consumer<TextFieldProvider>(
        builder: (context, textFieldProvider, child) {
          final String title =
              titleCallback?.call() ?? textFieldProvider.textFieldValue;
          return Text(
            title,
            style: TextStyle(
              color: titleColor ?? AppColors.white,
            ),
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
