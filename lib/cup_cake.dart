import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teaching/cupcake_flavor.dart';
import 'package:teaching/cupcake_model.dart';

class CupCake extends StatelessWidget {
  CupCake({super.key});
  CupcakeModel result = CupcakeModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CupCake'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.pink.shade100,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: FittedBox(
                child: Icon(
                  Icons.cake,
                  color: Colors.pink.shade900,
                ),
              ),
            ),
            const Text(
              'Order Cupcake',
              textScaleFactor: 1.4,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FlavorPage(
                          result: result.copyWith(quantity: 1, price: 4),
                        ),
                      ));
                },
                child: const Text('Take one')),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FlavorPage(
                          result: result.copyWith(quantity: 6, price: 4),
                        ),
                      ));
                },
                child: const Text('Take Six')),
            FilledButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FlavorPage(
                          result: result.copyWith(quantity: 12, price: 4),
                        ),
                      ));
                },
                child: const Text('Take twelve'))
          ],
        ),
      ),
    );
  }
}
