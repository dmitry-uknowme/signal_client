import 'package:flutter/material.dart';
import 'package:libadwaita/libadwaita.dart';
import 'package:libadwaita_bitsdojo/libadwaita_bitsdojo.dart';
import 'package:signal_flutter/pages/avatar_page.dart';
import 'package:provider/provider.dart';
import 'package:signal_flutter/store/CentrifugeContext.dart';

class DashboardPage extends StatefulWidget {
  // const DashboardPage({Key? key, required this.themeNotifier})
  //     : super(key: key);

  // final ValueNotifier<ThemeMode> themeNotifier;

  @override
  State<DashboardPage> createState() => _DashboardPageState();

  // @override
  // Widget build(BuildContext context){
  //   context.read
  // }
}

class _DashboardPageState extends State<DashboardPage> {
  int? _currentIndex = 0;

  late ScrollController listController;
  late ScrollController settingsController;
  late FlapController _flapController;
  late CentrifugeContext centrifugeContext;

  @override
  void initState() {
    super.initState();
    listController = ScrollController();
    settingsController = ScrollController();
    _flapController = FlapController();

    _flapController.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      centrifugeContext = Provider.of(context, listen: false);
      centrifugeContext.init();
    });
  }

  @override
  void dispose() {
    listController.dispose();
    settingsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // context.read<CentrifugeContext>().init();
    return AdwScaffold(
      // body: Provider,
      body: AdwViewStack(
        animationDuration: const Duration(milliseconds: 100),
        index: _currentIndex,
        children: [AvatarPage()],
      ),
      actions: AdwActions().bitsdojo,
      start: [
        AdwHeaderButton(
          icon: const Icon(Icons.view_sidebar_outlined, size: 19),
          isActive: _flapController.isOpen,
          onPressed: () => _flapController.toggle(),
        ),
        const AdwHeaderButton(
          icon: Icon(Icons.nightlight_round, size: 15),
        ),
      ],
      flap: (isDrawer) => AdwSidebar(
        currentIndex: _currentIndex,
        isDrawer: isDrawer,
        children: const [
          AdwSidebarItem(
            label: 'Панель управления',
          ),
          AdwSidebarItem(
            label: 'Статистика',
          ),
          AdwSidebarItem(
            label: 'Настройки',
          ),
        ],
        onSelected: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
