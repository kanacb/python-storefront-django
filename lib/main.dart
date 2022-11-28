import 'package:flutter/material.dart';
import 'package:goodyear_waste_example/service/ProductService.dart';

import 'model/Product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Good Year Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(items: List<String>.generate(100, (i) => 'Item $i')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final List<String> items;
  const MyHomePage({Key? key, required this.items}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Products'),
      ),
      body: FutureBuilder<Products>(
          future: fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return Container(
                padding: const EdgeInsets.all(20.0),
                child: const Text("No records found."),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data?.product.length,
                  itemBuilder: (context, index) {
                    return elevatedCardExample(snapshot.data?.product[index]);
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default, show a loading spinner.
            else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget elevatedCardExample(item) {
    return Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text('Name:${item.name}'),
              Text('${item.category}'),
              Text('${item.location}'),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
