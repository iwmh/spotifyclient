import 'package:flutter/material.dart';

class PlaylistCard extends StatelessWidget {
  final String name;

  PlaylistCard({this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(name),
      ),
    );
  }
}
