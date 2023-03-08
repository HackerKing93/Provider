import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_widget/favourt/faviourtScreen.dart';

import '../provider/favourt_provider.dart';

class MyfafiroutScreen extends StatefulWidget {
  const MyfafiroutScreen({super.key});

  @override
  State<MyfafiroutScreen> createState() => _MyfafiroutScreenState();
}

class _MyfafiroutScreenState extends State<MyfafiroutScreen> {
  @override
  Widget build(BuildContext context) {
    final FavourteProvider = Provider.of<FavourteItemProvider>(context);
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
                itemCount: FavourteProvider.selectedItem.length,
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
