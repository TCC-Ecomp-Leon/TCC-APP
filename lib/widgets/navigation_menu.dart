import 'package:flutter/material.dart';

class NavigationMenuItem {
  Widget child;
  BottomNavigationBarItem item;
  NavigationMenuItem({required this.child, required this.item});
}

// ignore: must_be_immutable
class NavigationMenu extends StatefulWidget {
  final List<NavigationMenuItem> children;
  List<GlobalKey<NavigatorState>>? _navigatorKeys;

  NavigationMenu({required this.children, Key? key}) : super(key: key) {
    _navigatorKeys = children.map((e) => GlobalKey<NavigatorState>()).toList();
  }

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await widget._navigatorKeys![selectedIndex].currentState!.maybePop(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Navigator(
          key: widget._navigatorKeys![selectedIndex],
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(
              builder: (context) => Center(
                child: widget.children.elementAt(selectedIndex).child,
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: widget.children.map((e) => e.item).toList(),
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
