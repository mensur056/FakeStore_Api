import 'package:flutter/material.dart';

class ProductDropdown extends StatefulWidget {
  const ProductDropdown({
    Key? key,
    required this.items,
    required this.onSelected,
  }) : super(key: key);
  final List<String> items;
  final Function(String data) onSelected;
  @override
  State<ProductDropdown> createState() => _ProductDropdownState();
}

class _ProductDropdownState extends State<ProductDropdown> {
  String? _selectedValue;

// ilk defede datanin gelmediyi veziyyetlerde didupdate istifade etmek
//old widgeti yoxlayib ona gore ekranda gostermek
//widget.items.isNotEmpty mutleq verilmelidi yoxsa crash atacaq
  @override
  void didUpdateWidget(covariant ProductDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.items != oldWidget.items && widget.items.isNotEmpty) {
      _changeValue(widget.items.first);
    }
  }

  void _changeValue(String? data) {
    if (data?.isEmpty ?? true) return;

    setState(() {
      _selectedValue = data!;
    });
    widget.onSelected(data!);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String?>(
      value: _selectedValue,
      items: widget.items
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
          .toList(),
      onChanged: (String? value) {
        _changeValue(value);
      },
    );
  }
}
