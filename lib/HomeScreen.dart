import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        color: Colors.lightBlue[50], 
        child: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/itemList');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://st2.depositphotos.com/5675002/11678/i/450/depositphotos_116786710-stock-photo-volumetric-image-pokeball-on-a.jpg', 
                  width: 200, 
                  height: 200, 
                ),
                SizedBox(height: 20), 
                Text(
                  'EU ESCOLHO VOCÊ!',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20), 
                Text(
                  'Pressione a Pokébola para entrar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
