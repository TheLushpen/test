import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_team/domain/entry.dart';
import 'package:gym_team/domain/repository.dart';
import 'package:gym_team/presentation/entities/entity_list_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EntitiesListWidget extends StatefulWidget {
  final Repository repository;

  const EntitiesListWidget({Key key, @required this.repository})
      : super(key: key);

  @override
  _EntitiesListWidgetState createState() => _EntitiesListWidgetState();
}

class _EntitiesListWidgetState extends State<EntitiesListWidget> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<Entity> entries;

  @override
  void initState() {
    super.initState();

    _fetchEntities();
  }

  ///Fetches entities and wait 5 sec (if wait) before deliver result
  void _fetchEntities({bool wait = false}) async => widget.repository
      .getEntities()
      .catchError(print)
      .then((value) async {
        //Wait 5 sec for looking to pull to refresh indicator
        if (wait) {
          await Future.delayed(Duration(seconds: 5));
        }

        return value;
      })
      .then((value) => setState(() => entries = value))
      .whenComplete(_refreshController.refreshCompleted);

  @override
  Widget build(BuildContext context) {
    if (entries != null && entries.isNotEmpty) {
      //Build list widget with pull to refresh
      return SmartRefresher(
        controller: _refreshController,
        onRefresh: () => _fetchEntities(wait: true),
        child: ListView.builder(
            itemCount: entries.length,
            itemBuilder: (_, index) => EntityListItem(entity: entries[index])),
      );
    }

    //Build progress or No data widget
    return Container(
      child: Center(
        child: entries == null
            ? const CircularProgressIndicator()
            : const Text("No data"),
      ),
    );
  }
}
