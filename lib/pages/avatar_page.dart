import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:provider/provider.dart';

import 'package:signal_flutter/store/CentrifugeContext.dart';

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
              ValueListenableBuilder<bool>(
                valueListenable: switchVal,
                builder: (context, val, _) => AdwSwitchRow(
                  title: 'Ручное управление',
                  value: val,
                  onChanged: (v) {
                    switchVal.value = v;
                  },
                  horizontalTitleGap: 0,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    //Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 0)),
                    AdwButton(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Text('Создать запись на въезд'),
                    ),
                    AdwButton(
                      padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                      backgroundColor: Colors.red,
                      child: Text('Создать запись на выезд'),
                    ),
                  ]),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
                Padding(padding: EdgeInsets.fromLTRB(20, 0, 0, 0)),
                Text("Въезд"),
                Icon(Icons.arrow_left, size: 50),
                Text("Шлагбаум №1"),
                Icon(Icons.arrow_right, size: 50),
                Text("Въезд"),
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
                Padding(padding: EdgeInsets.fromLTRB(20, 40, 0, 0)),
                Text("Въезд"),
                Icon(Icons.arrow_left, size: 50),
                Text("Шлагбаум №1"),
                Icon(Icons.arrow_right, size: 50),
                Text("Въезд"),
                // Padding(padding: EdgeInsets.all(100))
              ]),

              // ],

              // )
              // AdwClamp(
              //   child: ValueListenableBuilder<bool>(
              //     valueListenable: switchVal,
              //     builder: (context, val, _) => AdwSwitchRow(
              //       title: 'Ручное управление',
              //       value: val,
              //       onChanged: (v) {
              //         switchVal.value = v;
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
          // AdwPreferencesGroup(title: 'Панель управления', children: [
          //   AdwActionRow(
          //     start: Builder(builder: (BuildContext context) {
          //       return AdwClamp.scrollable(
          //           child: AdwPreferencesGroup(
          //               children: [Text("Въезд"), Text("Выезд")]));
          //     }),
          //     // start: Builder(BuildContext context) {
          //     //   return const AdwPreferencesGroup(children: [Text("dada")]);
          //     // },
          //     title: 'Johnny Appleseed',
          //   )
          // ]),
          //   AdwActionRow(
          //     title: "Въезд",
          //   ),
          //   AdwActionRow(
          //     title: "Выезд",
          //   ),
          // ]),
          // AdwPreferencesGroup(
          //   title: 'All colors',
          //   children: [
          //     for (var index
          //         in List.generate(AdwColors.values.length, (i) => i))
          //       AdwActionRow(
          //         start: AdwAvatar(
          //           backgroundColor: AdwColors.values[index],
          //           child: Text(index.toString()),
          //         ),
          //         title: 'Johnny Appleseed',
          //       ),
          //   ],
          // ),
        ]));
    //   return AdwClamp.scrollable(

    //   //     child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [

    //   //   // Text(

    //   //   //     /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
    //   //   //     'Текущий вес: ${context.watch<CentrifugeContext>().data}',
    //   //   //     key: const Key('weightState'),
    //   //   //     style: Theme.of(context).textTheme.headline4)
    //   // ]));
    // }
  }
}
