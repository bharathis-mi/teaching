import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transparent_image/transparent_image.dart';

import 'product_model.dart';
import 'service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

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
          )
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var username = TextEditingController();
  var password = TextEditingController();
  var loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: username,
            ),
            TextField(
              controller: password,
            ),
            FilledButton(
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  if (username.text.isNotEmpty && password.text.isNotEmpty) {
                    var response = await login(username.text, password.text);
                    if (response == true) {
                      //navigation
                    }
                  }

                  setState(() {
                    loading = false;
                  });
                },
                child: const Text('Login')),
            Visibility(
                visible: loading, child: const CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late Future<List<Product>> futureProduct;
  @override
  void initState() {
    futureProduct = fetchProduct();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    ));
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