import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';

class Modal extends StatefulWidget {
  const Modal(
      {Key? key,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      this.header,
      this.body,
      this.buttons})
      : super(key: key);

  final EdgeInsets padding;
  final Widget? header;
  final Widget? body;
  final Widget? buttons;

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  @override
  Widget build(BuildContext context) {
    return GtkDialog(title: widget.header, padding: widget.padding, children: [
      if (widget.body != null) widget.body!,
      Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: widget.buttons)
    ]);
  }
}
