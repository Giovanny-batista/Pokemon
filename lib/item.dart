class Item {
  final String name;
  final String imageUrl;
  bool isFavorited;

  Item({required this.name, required this.imageUrl, this.isFavorited = false});

  factory Item.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${json['url'].split('/')[6]}.png";
    return Item(name: name, imageUrl: imageUrl);
  }
}
