import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';
import 'package:signal_flutter/widgets/Modal/Modal.dart';
import 'package:signal_flutter/widgets/Modal/ModalEnter.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final switchVal = ValueNotifier(false);
    return AdwClamp.scrollable(
        center: false,
        child: Column(children: [
          AdwPreferencesGroup(
            title: 'Панель управления',
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ResponsiveGridRow(children: [
                  ResponsiveGridCol(
                      md: 1,
                      child: ValueListenableBuilder<bool>(
                        valueListenable: switchVal,
                        builder: (context, val, _) => SizedBox(
                          width: 30,
                          height: 16,
                          child: AdwSwitch(
                            value: val,
                            onChanged: (v) {
                              switchVal.value = v;
                            },
                          ),
                        ),
                      )),
                  ResponsiveGridCol(
                    md: 1,
                    child: const Text(""),
                  ),
                  ResponsiveGridCol(
                      md: 3, child: const Text("Ручное управление"))
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: ResponsiveGridRow(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ResponsiveGridCol(
                        md: 2,
                        child: Row(
                          children: [
                            const Text("Въезд"),
                            GestureDetector(
                              onTap: () => print("tap"),
                              child: const Icon(Icons.arrow_left, size: 50),
                            ),
                          ],
                        )),
                    ResponsiveGridCol(
                      md: 1,
                      child: const Text(""),
                    ),
                    ResponsiveGridCol(
                        md: 3,
                        child: const Text(
                          "Шлагбаум №1",
                          textAlign: TextAlign.center,
                        )),
                    ResponsiveGridCol(
                      md: 1,
                      child: const Text(""),
                    ),
                    ResponsiveGridCol(
                        md: 2,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => print("tap"),
                              child: const Icon(Icons.arrow_right, size: 50),
                            ),
                            const Text("Выезд"),
                          ],
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                child: ResponsiveGridRow(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ResponsiveGridCol(
                        md: 2,
                        child: Row(
                          children: [
                            const Text("Въезд"),
                            GestureDetector(
                              onTap: () => print("tap"),
                              child: const Icon(Icons.arrow_left, size: 50),
                            ),
                          ],
                        )),
                    ResponsiveGridCol(
                      md: 1,
                      child: const Text(""),
                    ),
                    ResponsiveGridCol(
                        md: 3,
                        child: const Text(
                          "Шлагбаум №2",
                          textAlign: TextAlign.center,
                        )),
                    ResponsiveGridCol(
                      md: 1,
                      child: const Text(""),
                    ),
                    ResponsiveGridCol(
                        md: 2,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => print("tap"),
                              child: const Icon(Icons.arrow_right, size: 50),
                            ),
                            const Text("Выезд"),
                          ],
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ResponsiveGridRow(children: [
                  ResponsiveGridCol(
                      md: 4,
                      child: AdwButton(
                          isActive: true,
                          backgroundColor: Colors.green[600],
                          child: const Text(
                            "Создать запись на въезд",
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () => showDialog(
                                context: context,
                                builder: (ctx) => ModalEnter(),
                              ))),
                  // GtkDialog(
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 20, vertical: 50),
                  //         title: const Text("Взвешивание брутто",
                  //             style: TextStyle(fontSize: 20)),
                  //         children: [
                  //           ResponsiveGridRow(
                  //               crossAxisAlignment:
                  //                   CrossAxisAlignment.center,
                  //               children: [
                  //                 ResponsiveGridCol(
                  //                   md: 4,
                  //                   child: const Text(
                  //                     "Гос.номер авто:",
                  //                     style: TextStyle(fontSize: 14),
                  //                   ),
                  //                 ),
                  //                 ResponsiveGridCol(
                  //                   md: 8,
                  //                   child: const AdwTextField(
                  //                     initialValue: "",
                  //                   ),
                  //                 )
                  //               ]),
                  //           Padding(
                  //             padding: const EdgeInsets.only(top: 20),
                  //             child: ResponsiveGridRow(
                  //                 crossAxisAlignment:
                  //                     CrossAxisAlignment.center,
                  //                 children: [
                  //                   ResponsiveGridCol(
                  //                     md: 4,
                  //                     child: const Text(
                  //                       "Контрагент:",
                  //                       style: TextStyle(fontSize: 14),
                  //                     ),
                  //                   ),
                  //                   ResponsiveGridCol(
                  //                     md: 8,
                  //                     child: const AdwTextField(
                  //                       initialValue: "",
                  //                     ),
                  //                   )
                  //                 ]),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.only(
                  //               top: 20,
                  //             ),
                  //             child: ResponsiveGridRow(
                  //                 crossAxisAlignment:
                  //                     CrossAxisAlignment.center,
                  //                 children: [
                  //                   ResponsiveGridCol(
                  //                     md: 4,
                  //                     child: const Text(
                  //                       "Категория груза:",
                  //                       style: TextStyle(fontSize: 14),
                  //                     ),
                  //                   ),
                  //                   ResponsiveGridCol(
                  //                     md: 8,
                  //                     child: const AdwTextField(
                  //                       initialValue: "",
                  //                     ),
                  //                   )
                  //                 ]),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.only(
                  //               top: 20,
                  //             ),
                  //             child: ResponsiveGridRow(
                  //                 crossAxisAlignment:
                  //                     CrossAxisAlignment.center,
                  //                 children: [
                  //                   ResponsiveGridCol(
                  //                     md: 4,
                  //                     child: const Text(
                  //                       "Вид груза:",
                  //                       style: TextStyle(fontSize: 14),
                  //                     ),
                  //                   ),
                  //                   ResponsiveGridCol(
                  //                     md: 8,
                  //                     child: const AdwTextField(
                  //                       initialValue: "",
                  //                     ),
                  //                   )
                  //                 ]),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.only(
                  //               top: 20,
                  //             ),
                  //             child: ResponsiveGridRow(
                  //                 crossAxisAlignment:
                  //                     CrossAxisAlignment.center,
                  //                 children: [
                  //                   ResponsiveGridCol(
                  //                     md: 4,
                  //                     child: const Text(
                  //                       "Комментарий:",
                  //                       style: TextStyle(fontSize: 14),
                  //                     ),
                  //                   ),
                  //                   ResponsiveGridCol(
                  //                     md: 8,
                  //                     child: const AdwTextField(
                  //                       keyboardType:
                  //                           TextInputType.multiline,
                  //                       initialValue: "",
                  //                     ),
                  //                   )
                  //                 ]),
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.only(
                  //               top: 60,
                  //             ),
                  //             child: ResponsiveGridRow(
                  //                 crossAxisAlignment:
                  //                     CrossAxisAlignment.center,
                  //                 children: [
                  //                   ResponsiveGridCol(
                  //                       md: 5,
                  //                       child: Container(
                  //                         alignment:
                  //                             const Alignment(0, 0),
                  //                         child: AdwButton(
                  //                           isActive: true,
                  //                           backgroundColor:
                  //                               Colors.red[600],
                  //                           child: const Text(
                  //                             "Отклонить",
                  //                             textAlign:
                  //                                 TextAlign.center,
                  //                           ),
                  //                         ),
                  //                       )),
                  //                   ResponsiveGridCol(
                  //                       md: 1, child: const Text("")),
                  //                   ResponsiveGridCol(
                  //                       md: 5,
                  //                       child: Container(
                  //                         alignment:
                  //                             const Alignment(0, 0),
                  //                         child: AdwButton(
                  //                           isActive: true,
                  //                           backgroundColor:
                  //                               Colors.green[600],
                  //                           child: const Text(
                  //                             "Разрешить въезд",
                  //                             textAlign:
                  //                                 TextAlign.center,
                  //                           ),
                  //                           onPressed: () =>
                  //                               Navigator.of(context)
                  //                                   .pop(),
                  //                         ),
                  //                       )),
                  //                 ]),
                  //           )
                  //         ])
                  // ),
                  // ),
                  ResponsiveGridCol(
                    md: 1,
                    child: const Text(""),
                  ),
                  ResponsiveGridCol(
                    md: 4,
                    child: AdwButton(
                      isActive: true,
                      backgroundColor: Colors.red[600],
                      child: const Text(
                        "Создать запись на выезд",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ]));
  }
}
