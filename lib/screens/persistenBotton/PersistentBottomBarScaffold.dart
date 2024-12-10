import 'package:flutter/material.dart';
import 'PersistentTabItem.dart';

class PersistentBottomBarScaffold extends StatefulWidget {
  final List<PersistentTabItem> items; // Lista de pestañas

  const PersistentBottomBarScaffold({Key? key, required this.items})
      : super(key: key);

  @override
  State<PersistentBottomBarScaffold> createState() =>
      _PersistentBottomBarScaffoldState();
}

class _PersistentBottomBarScaffoldState
    extends State<PersistentBottomBarScaffold> {
  int _selectedTab = 0; // Tab seleccionada actualmente

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Gestiona el botón "Atrás" para cada pestaña
        if (widget.items[_selectedTab].navigatorkey?.currentState?.canPop() ??
            false) {
          widget.items[_selectedTab].navigatorkey?.currentState?.pop();
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _selectedTab,
          children: widget.items.map((item) {
            return Navigator(
              key: item.navigatorkey,
              onGenerateInitialRoutes: (_, __) {
                return [MaterialPageRoute(builder: (_) => item.tab)];
              },
            );
          }).toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) {
            setState(() {
              _selectedTab = index;
            });
          },
          items: widget.items
              .map((item) => BottomNavigationBarItem(
                    icon: Icon(item.icon),
                    label: item.title,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
