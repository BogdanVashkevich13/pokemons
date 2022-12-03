class Pokemons {
  final String url;
  final String name;

  const Pokemons({
    required this.name,
    required this.url,
  });

  factory Pokemons.fromMap(Map<String, dynamic> map) {
    return Pokemons(
      name: map['name'] != null ? map['name'] as String : "No Name",
      url: map['url'] != null
          ? map['url'] as String
          : "https://images.unsplash.com/photo-1665931500523-98ae696c47f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
    );
  }
}