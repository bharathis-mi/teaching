import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import 'product_model.dart';
import 'service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  late Future<List<Product>> futureProduct;
  @override
  void initState() {
    futureProduct = fetchProduct();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: FutureBuilder(
        future: futureProduct,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      FadeInImage(
                        width: double.infinity,
                        height: 400,
                        placeholder: MemoryImage(kTransparentImage),
                        image: NetworkImage(data[index].image),
                      ),
                      ListTile(
                        title: Text(
                          data[index].title,
                          style: const TextStyle(fontWeight: FontWeight.w900),
                        ),
                        subtitle: Text(data[index].description),
                        trailing: Text('\$${data[index].price.toString()}'),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      )),
    );
  }
}



/*
 1. Find API
   https://fakestoreapi.com/docs

 2. Write Model with factory method
 
 3. Check http package is added or not

 4. Future Method - with or without return type 
    4.1 - Check response to be 200 or not

 5. initiate init State with Futute method;

 6. FutureBuilder with listview










 */