import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:responsive_grid/responsive_grid.dart';

class ModalFormField extends StatefulWidget {
  const ModalFormField(
      {Key? key,
      required this.label,
      required this.initialValue,
      required this.controller,
      this.padding = const EdgeInsets.only(top: 20)})
      : super(key: key);

  final EdgeInsets padding;
  final String label;
  final String initialValue;
  final TextEditingController controller;

  @override
  State<ModalFormField> createState() => _ModalFormFieldState();
}

class _ModalFormFieldState extends State<ModalFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: widget.padding,
        child: ResponsiveGridRow(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResponsiveGridCol(
                md: 4,
                child: Text(
                  widget.label,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              ResponsiveGridCol(
                md: 8,
                child: AdwTextField(
                  initialValue: widget.initialValue,
                  controller: widget.controller,
                ),
              )
            ]));
  }
}
