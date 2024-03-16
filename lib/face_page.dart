import 'package:flutter/material.dart';

class FacePage extends StatelessWidget {
  const FacePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        return Future<void>.delayed(const Duration(seconds: 3));
      },
      child: const SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text("Face title"),
                subtitle: Text("Face SubTitle is here"),
                leading: CircleAvatar(
                  child: Icon(Icons.face),
                ),
                trailing: Icon(
                  Icons.attractions,
                  size: 32,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


/* 16 mar 

1. Scaffold


2.appBar and menu

3.ListTile


4.https://docs.flutter.dev/deployment/android

diawi.com

https://flutter-gallery-archive.web.app/

fonts.google.com/icons
*/