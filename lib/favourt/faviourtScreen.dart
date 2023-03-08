import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_widget/favourt/myfavouirte.dart';
import 'package:provider_widget/provider/favourt_provider.dart';

class FaviourtScreen extends StatefulWidget {
  const FaviourtScreen({super.key});

  @override
  State<FaviourtScreen> createState() => _FaviourtScreenState();
}

class _FaviourtScreenState extends State<FaviourtScreen> {
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    print('object');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourte App'),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyfafiroutScreen()));
              },
              child: Icon(Icons.favorite)),
          const SizedBox(
            width: 20,
          )
        ],
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
                itemBuilder: (context, index) {
                  return Consumer<FavourteItemProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItems(index);
                        } else {
                          value.addItems(index);
                        }
                      },
                      title: Text('Item ' + index.toString()),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
