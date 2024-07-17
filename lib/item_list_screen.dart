import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'item_provider.dart';

class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Pesquisar Pokémon...',
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.grey),
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
            ),
            style: TextStyle(color: Colors.black),
            onChanged: (value) {
              itemProvider.setSearchQuery(value);
            },
          ),
        ),
        actions: [
          Tooltip(
            message: 'Favoritos',
            child: IconButton(
              icon: Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                Navigator.pushNamed(context, '/favorites');
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.lightBlue[50], // Cor de fundo suave
        child: FutureBuilder(
          future: itemProvider.fetchItems(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Consumer<ItemProvider>(
                builder: (context, itemProvider, child) {
                  return ListView.builder(
                    itemCount: itemProvider.items.length,
                    itemBuilder: (context, index) {
                      final item = itemProvider.items[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3), 
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.network(item.imageUrl),
                                          Text(item.name, style: TextStyle(fontSize: 20)),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                child: Image.network(item.imageUrl, width: 50, height: 50),
                              ),
                              title: Text(item.name),
                              trailing: IconButton(
                                icon: Icon(
                                  item.isFavorited ? Icons.star : Icons.star_border,
                                  color: item.isFavorited ? Colors.yellow : null,
                                ),
                                onPressed: () {
                                  itemProvider.toggleFavoriteStatus(item);
                                },
                                tooltip: 'Favoritar',
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
