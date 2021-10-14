import 'package:flutter/material.dart';

class RightPage extends StatefulWidget {
  const RightPage({Key? key}) : super(key: key);

  @override
  _RightPageState createState() => _RightPageState();
}

class _RightPageState extends State<RightPage> {
  late List<String> product = ["product1", 'product 2', 'product3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text("Shop Data"),
      ),
      body: ListView.builder(
        itemCount: product.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
            child: Card(
                child: ListTile(
              onTap: () {},
              title: Text(product[index]),
            )),
          );
        },
      ),
    );
  }
}
