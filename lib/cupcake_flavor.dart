import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:teaching/cupcake_model.dart';

class FlavorPage extends StatefulWidget {
  const FlavorPage({super.key, required this.result});
  final CupcakeModel result;
  @override
  State<FlavorPage> createState() => _FlavorPageState();
}

class _FlavorPageState extends State<FlavorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Cupcake'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink.shade100,
      ),
      body: Center(
        child: FilledButton(
          child: const Text("Send Cupcake"),
          onPressed: () async {
            final result = await Share.shareWithResult(
                'Hello Dude! ${widget.result.quantity} Cupcakes is order for ${widget.result.quantity * widget.result.price}');

            if (result.status == ShareResultStatus.success) {
              print('Thank you ');
            }
          },
        ),
      ),
    );
  }
}
