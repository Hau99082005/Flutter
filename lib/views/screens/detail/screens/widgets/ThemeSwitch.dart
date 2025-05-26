import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:window_app/main.dart';

class Themeswitch extends StatefulWidget {
  const Themeswitch({super.key});

  @override
  State<Themeswitch> createState() => _ThemeswitchState();
}

class _ThemeswitchState extends State<Themeswitch> {
  bool _isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text("Chế Độ Tối", style: GoogleFonts.quicksand(fontSize: 16,
      fontWeight: FontWeight.bold,),),
        value: _isDarkMode,
        onChanged: (bool value) {
        setState(() {
          _isDarkMode = value;
        });
        ThemeMode themeMode = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
        MyApp.of(context)?.setThemeMode(themeMode);
        });
  }
}
