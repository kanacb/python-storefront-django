import 'package:flutter/material.dart';

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
      appBar: AppBar(title: const Text('App Bar'),),
      body: ListView.builder(
        itemCount: widget.items.length,
        prototypeItem: ListTile(
          title: Text( widget.items.first),
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text( widget.items[index]),
          );
        },
      ),
    );
  }
}

