import 'package:flutter/material.dart';

class PlaylistCard extends StatelessWidget {
  final String id;
  final String name;
  final String imageUrl;

  PlaylistCard({this.id, this.name, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      onLongPress: () => {},
      child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(3.0),
                height: MediaQuery.of(context).size.width * 0.2,
                width: MediaQuery.of(context).size.width * 0.2,
                child: Image.network(imageUrl),
              ),
              Container(
                padding: EdgeInsets.all(3.0),
                height: MediaQuery.of(context).size.width * 0.8,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(name),
              )
            ],
          )),
    );
  }
}
