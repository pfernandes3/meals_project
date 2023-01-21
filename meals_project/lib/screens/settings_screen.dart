import 'package:flutter/material.dart';
import 'package:meals_project/components/drawer.dart';
import 'package:meals_project/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(this.onSettingsChanged, this.settings);
  final Function(Settings) onSettingsChanged;
  final Settings settings;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Settings? settings;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
      String title, String subtitle, bool value, onChanged(bool)) {
    return SizedBox(
      height: 100,
      child: SwitchListTile.adaptive(
        contentPadding: const EdgeInsets.all(20),
        activeColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(fontSize: 25, fontFamily: 'Raleway'),
        ),
        value: value,
        onChanged: (value) {
          onChanged(value);
          widget.onSettingsChanged(settings!);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Configurações'),
        ),
        drawer: const DrawerComponent(),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _createSwitch(
                      'Sem Glúten',
                      'Só exibe refeições sem glúten',
                      settings!.isGlutenFree,
                      (value) => setState(
                            () => settings!.isGlutenFree = value,
                          )),
                  _createSwitch(
                      'Sem Lactose',
                      'Só exibe refeições sem lactose',
                      settings!.isLactoseFree,
                      (value) => setState(
                            () => settings!.isLactoseFree = value,
                          )),
                  _createSwitch(
                      'Refeição Vegana',
                      'Só exibe refeições veganas',
                      settings!.isVegan,
                      (value) => setState(
                            () => settings!.isVegan = value,
                          )),
                  _createSwitch(
                      'Refeição Vegetariana',
                      'Só exibe refeições vegetarianas',
                      settings!.isVegetarian,
                      (value) => setState(
                            () => settings!.isVegetarian = value,
                          )),
                ],
              ),
            )
          ],
        ));
  }
}
