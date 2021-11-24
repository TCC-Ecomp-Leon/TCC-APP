import 'package:flutter/material.dart';
import 'package:tcc_app/screens/administracao.dart';
import 'package:tcc_app/screens/cursos.dart';
import 'package:tcc_app/screens/dummy.dart';
import 'package:tcc_app/screens/perfil.dart';
import 'package:tcc_app/widgets/navigation_menu.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NavigationMenu(
      children: [
        NavigationMenuItem(
          child: const Administracao(),
          item: const BottomNavigationBarItem(
            label: "Administração",
            icon: Icon(Icons.admin_panel_settings),
          ),
        ),
        NavigationMenuItem(
          child: const Dummy(),
          item: const BottomNavigationBarItem(
            label: "Projeto",
            icon: Icon(Icons.home),
          ),
        ),
        NavigationMenuItem(
          child: Cursos(),
          item: const BottomNavigationBarItem(
            label: "Cursos",
            icon: Icon(Icons.list),
          ),
        ),
        NavigationMenuItem(
          child: const Dummy(),
          item: const BottomNavigationBarItem(
            label: "Colaboração",
            icon: Icon(Icons.blur_circular_rounded),
          ),
        ),
        NavigationMenuItem(
          child: const Dummy(),
          item: const BottomNavigationBarItem(
            label: "Dúvidas",
            icon: Icon(Icons.question_answer),
          ),
        ),
        NavigationMenuItem(
          child: const Perfil(),
          item: const BottomNavigationBarItem(
            label: "Perfil",
            icon: Icon(Icons.person),
          ),
        ),
      ],
    );
  }
}
