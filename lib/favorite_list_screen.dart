import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item_provider.dart';

class FavoriteListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Favoritos'),
      ),
      body: Container(
        color: Colors.lightBlue[50], 
        child: Consumer<ItemProvider>(
          builder: (context, itemProvider, child) {
            final favoritedItems = itemProvider.favoritedItems;
            return ListView.builder(
              itemCount: favoritedItems.length,
              itemBuilder: (context, index) {
                final item = favoritedItems[index];
                return ListTile(
                  leading: Image.network(item.imageUrl, width: 50, height: 50),
                  title: Text(item.name),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle, color: Colors.red),
                    onPressed: () {
                      itemProvider.removeFavorite(item);
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
