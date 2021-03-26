import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:gym_team/domain/repository.dart';
import 'package:gym_team/presentation/entities/entities_list.dart';

class MainPage extends StatelessWidget {
  final Repository repository;

  MainPage({Key key, @required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: SafeArea(child: EntitiesListWidget(repository: repository)),
      bottomNavBar: _buildBottomBar(context),
    );
  }

  Widget _buildBottomBar(BuildContext context) => PlatformNavBar(
        items: [
          BottomNavigationBarItem(
            label: "Lessons",
            icon: Icon(PlatformIcons(context).collections),
          ),
          BottomNavigationBarItem(
            label: "Person",
            icon: Icon(PlatformIcons(context).person),
          )
        ],
      );
}
