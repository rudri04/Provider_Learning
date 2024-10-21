import 'package:favoutiteitems/Provider/theme_changer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DarkTheme>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Changer'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioListTile<ThemeMode>(
                title: const Text('Light Mode'),
                  value: ThemeMode.light,
                  groupValue: provider.themeMode,
                  onChanged: provider.setTheme),

            RadioListTile<ThemeMode>(
                title: const Text('dark Mode'),
                value: ThemeMode.dark,
                groupValue: provider.themeMode,
                onChanged: provider.setTheme),

            RadioListTile<ThemeMode>(
                title: const Text('System Mode'),
                value: ThemeMode.system,
                groupValue: provider.themeMode,
                onChanged: provider.setTheme),
            
            Icon(Icons.save)
          ],
        ),
      ),
    );
  }
}
