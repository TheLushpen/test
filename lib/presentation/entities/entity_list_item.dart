import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_team/domain/entry.dart';
import 'package:transparent_image/transparent_image.dart';

class EntityListItem extends StatelessWidget {
  final Entity entity;
  final double gradientHeight;

  const EntityListItem({
    Key key,
    @required this.entity,
    this.gradientHeight = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: entity.aspectRatio,
      child: Stack(children: [
        _buildImage(context),
        Align(
          alignment: Alignment.bottomCenter,
          child: _buildGradient(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: buildTitle(),
        )
      ]),
    );
  }

  Widget _buildImage(BuildContext context) => FadeInImage.memoryNetwork(
        placeholder: kTransparentImage,
        image: entity.url,
        imageCacheWidth: MediaQuery.of(context).size.width.toInt(),
      );

  Widget _buildGradient() => Container(
      height: gradientHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black87,
          ],
        ),
      ));

  Widget buildTitle() => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Text(entity.title,
            style: const TextStyle(color: Colors.white, fontSize: 20)),
      );
}
