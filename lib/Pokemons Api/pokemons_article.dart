class PokeListModel {
  List<dynamic>? poke;
  PokeListModel({
    this.poke,
  });

  factory PokeListModel.fromMap(Map<String, dynamic> map) {
    return PokeListModel(poke: map['poke']);
  }
}