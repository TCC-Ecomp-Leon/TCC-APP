import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_app/app/modules/bottomMenu/bottom_menu_controller.dart';

class BottomMenuView<T extends BottomMenuController> extends StatelessWidget {
  Widget child;
  T controller;
  BottomMenuView({
    required this.child,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          children: controller.pageList.map((e) => e.page).toList(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: controller.pageList
              .map(
                (e) => BottomNavigationBarItem(
                  icon: e.icon,
                  label: e.label,
                ),
              )
              .toList(),
          onTap: (index) {
            controller.setPage(index);
          },
          currentIndex: controller.tabIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
