import 'package:flutter/material.dart';
import 'package:meals_project/utils/app-routes.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({super.key});

  Widget _createItem(IconData icon, String label, VoidCallback onTapF) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(
        icon,
        size: 26,
      ),
      onTap: onTapF,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            height: 120,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child: Text(
              'Vamos cozinhar?',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).colorScheme.primary),
            ),
          ),
          _createItem(Icons.restaurant, 'Lista de Refeições',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)),
          _createItem(Icons.settings, 'Configurações',
              () => Navigator.of(context).pushReplacementNamed(AppRoutes.SETTINGS)),
        ],
      ),
    );
  }
}
