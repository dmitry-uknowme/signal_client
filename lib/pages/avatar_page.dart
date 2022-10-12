import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:responsive_grid/responsive_grid.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

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
                padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
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
                padding: const EdgeInsets.all(10),
                child: ResponsiveGridRow(children: [
                  ResponsiveGridCol(
                    md: 4,
                    child: AdwButton(
                      isActive: true,
                      backgroundColor: Colors.green[600],
                      child: const Text("Создать запись на выезд"),
                    ),
                  ),
                  ResponsiveGridCol(
                    md: 1,
                    child: const Text(""),
                  ),
                  ResponsiveGridCol(
                    md: 4,
                    child: AdwButton(
                      isActive: true,
                      backgroundColor: Colors.red[600],
                      child: const Text("Создать запись на въезд"),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ]));
  }
}
