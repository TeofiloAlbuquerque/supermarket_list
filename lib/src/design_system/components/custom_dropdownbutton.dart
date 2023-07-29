import 'package:flutter/material.dart';

class CustomDropdownButton extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String selectItem;
  final List<String> items;

  const CustomDropdownButton({
    super.key,
    required this.onChanged,
    required this.selectItem,
    required this.items,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget
          .selectItem, // widget é usado para termos acesso a variavel da classe acima
      icon: const Icon(
        Icons.keyboard_arrow_down,
      ),
      items: [
        for (String item in widget.items)
          DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          ),
      ],
      onChanged: (String? newItem) {
        setState(() {
          widget.onChanged(newItem!);
        });
      },
    );
  }
}
