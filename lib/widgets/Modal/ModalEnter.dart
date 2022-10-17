import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:signal_flutter/widgets/Modal/Form/ModalFormField.dart';
import 'package:signal_flutter/widgets/Modal/Modal.dart';

class ModalEnterFormControllers {
  // ModalEnterFormControllers(
  //     {required this.numberPlate,
  //     required this.contragentName,
  //     required this.cargoCategory,
  //     required this.cargoType,
  //     required this.comment});
  final TextEditingController numberPlate = TextEditingController();
  final TextEditingController contragentName = TextEditingController();
  final TextEditingController cargoCategory = TextEditingController();
  final TextEditingController cargoType = TextEditingController();
  final TextEditingController comment = TextEditingController();
}

class ModalEnter extends StatefulWidget {
  ModalEnter({
    Key? key,
    this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
  }) : super(key: key);

  final EdgeInsets padding;

  final _formKey = GlobalKey<FormState>();
  final ModalEnterFormControllers _formController = ModalEnterFormControllers();

  @override
  State<ModalEnter> createState() => _ModalEnterState();
}

class _ModalEnterState extends State<ModalEnter> {
  @override
  Widget build(BuildContext context) {
    return Modal(
      header: const Text("Взвешивание брутто", style: TextStyle(fontSize: 20)),
      body: Form(
        key: widget._formKey,
        child: Column(children: [
          ModalFormField(
            label: "Гос.номер авто",
            initialValue: "",
            controller: widget._formController.numberPlate,
          ),
          ModalFormField(
              label: "Контрагент",
              initialValue: "",
              controller: widget._formController.contragentName),
          ModalFormField(
              label: "Категория груза",
              initialValue: "",
              controller: widget._formController.cargoCategory),
          ModalFormField(
            label: "Вид груза",
            initialValue: "",
            controller: widget._formController.cargoType,
          ),
          ModalFormField(
            label: "Комментарий",
            initialValue: "",
            controller: widget._formController.comment,
          ),
        ]),
      ),
      buttons: Padding(
        padding: const EdgeInsets.only(
          top: 60,
        ),
        child: ResponsiveGridRow(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResponsiveGridCol(
                  md: 5,
                  child: Container(
                    alignment: const Alignment(0, 0),
                    child: AdwButton(
                      isActive: true,
                      backgroundColor: Colors.red[600],
                      opaque: true,
                      child: const Text(
                        "Отклонить",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  )),
              ResponsiveGridCol(md: 1, child: const Text("")),
              ResponsiveGridCol(
                  md: 5,
                  child: Container(
                    alignment: const Alignment(0, 0),
                    child: AdwButton(
                      isActive: true,
                      backgroundColor: Colors.green[600],
                      opaque: true,
                      child: const Text(
                        "Разрешить въезд",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  )),
            ]),
      ),
    );
  }
}
