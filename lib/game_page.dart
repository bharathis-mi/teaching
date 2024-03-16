import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Card(
          child: ListTile(
            title: Text("Game title"),
            subtitle: Text("Game SubTitle is here"),
            leading: CircleAvatar(
              child: Icon(Icons.gamepad),
            ),
            trailing: Icon(
              Icons.attractions,
              size: 32,
            ),
          ),
        )
      ],
    );
  }
}
