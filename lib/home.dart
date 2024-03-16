import 'package:flutter/material.dart';
import 'package:teaching/container_background.dart';
import 'package:teaching/form_page.dart';
import 'package:teaching/main.dart';
import 'package:teaching/scaffold_page.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: ListTile(
              title: const Text('Login Page'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Product'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Form'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FormPage()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Container'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ContainerBackground()));
              },
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Scaffold'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScaffoldPage()));
              },
            ),
          )
        ],
      ),
    );
  }
}
