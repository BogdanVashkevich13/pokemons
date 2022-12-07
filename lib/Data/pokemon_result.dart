class PokemonResult {
  PokemonResult({required this.name, required this.url});

  final String name;
  final String url;

  factory PokemonResult.fromJson(Map<String, dynamic> json) =>
      PokemonResult(
        name: json['name'],
        url: json['url'],
      );
}