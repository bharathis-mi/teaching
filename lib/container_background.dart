import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_bar_code/code/src/code_generate.dart';
import 'package:qr_bar_code/code/src/code_type.dart';
import 'package:simple_barcode_scanner/enum.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class ContainerBackground extends StatefulWidget {
  const ContainerBackground({super.key});

  @override
  State<ContainerBackground> createState() => _ContainerBackgroundState();
}

class _ContainerBackgroundState extends State<ContainerBackground> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.pexels.com/photos/1366919/pexels-photo-1366919.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'))),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.5),
          ),
          DefaultTextStyle(
              style: const TextStyle(color: Colors.white),
              child: Column(
                children: [
                  Expanded(
                    child: Card(
                      margin: const EdgeInsets.all(30),
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://images.pexels.com/photos/9959962/pexels-photo-9959962.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'))),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.black.withOpacity(0.5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Code(
                                      color: Colors.white,
                                      data: "https://datadirr.com",
                                      codeType: CodeType.qrCode()),
                                  FilledButton(
                                      onPressed: () async {
                                        var res = await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const SimpleBarcodeScannerPage(
                                                scanType: ScanType.qr,
                                              ),
                                            ));
                                        setState(() {
                                          if (res is String) {
                                            result = res;
                                          }
                                        });
                                      },
                                      child: const Text('Scan'))
                                ],
                              ),
                            ),
                            const Positioned(
                                child: Icon(
                              Icons.heart_broken,
                              size: 100,
                              color: Colors.red,
                            )),
                            const Positioned(
                              right: 0,
                              bottom: 0,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.thumb_up,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.thumb_down,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.message,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.refresh,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return const Card();
                    },
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
