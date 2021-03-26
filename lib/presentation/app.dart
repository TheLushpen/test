import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:gym_team/injector.dart';
import 'package:gym_team/presentation/main_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final brightness = WidgetsBinding.instance.window.platformBrightness;

    return PlatformApp(
      title: 'Gym Team',
      material: (_, __) =>
          MaterialAppData(theme: _buildMaterialTheme(brightness)),
      cupertino: (_, __) =>
          CupertinoAppData(theme: _buildCupertinoTheme(brightness)),
      home: MainPage(repository: Injector.repository),
    );
  }

  ThemeData _buildMaterialTheme(Brightness brightness) =>
      ThemeData(brightness: brightness);

  CupertinoThemeData _buildCupertinoTheme(Brightness brightness) =>
      CupertinoThemeData(brightness: brightness);
}
