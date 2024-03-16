import 'package:flutter/material.dart';

class HailPage extends StatelessWidget {
  const HailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Card(
          child: ListTile(
            title: Text("Hail title"),
            subtitle: Text("Hail SubTitle is here"),
            leading: CircleAvatar(
              child: Icon(Icons.hail),
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
