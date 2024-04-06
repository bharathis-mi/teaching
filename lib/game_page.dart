import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({
    super.key,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double value = 0;
  bool switchVal = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Tooltip(
          message: "I'm Card",
          child: Card(
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
          ),
        ),
        Slider(
          activeColor: Colors.red,
          divisions: 5,
          value: value,
          onChanged: (val) {
            setState(() {
              value = val;
            });
          },
          max: 100,
        ),
        Checkbox(
          value: switchVal,
          onChanged: (value) {
            setState(() {
              switchVal = value!;
            });
          },
        ),
        Tooltip(
          message: "I'm Switch",
          child: Switch(
            value: switchVal,
            onChanged: (value) {
              setState(() {
                switchVal = value;
              });
            },
          ),
        ),
        const Tooltip(
          message: 'I am a Tooltip',
          triggerMode: TooltipTriggerMode.tap,
          child: Text('Hover over the text to show a tooltip.'),
        )
      ],
    );
  }
}
