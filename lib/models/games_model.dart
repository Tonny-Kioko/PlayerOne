import 'dart:html';

class Game {
  int? _totalSize;
  int? _typeID;
  int? _offset;
  late List<GameModel> _games;
  List<GameModel> get games => _games;

  Game({required offset, required totalSize, required typeID, required games}) {
    this._totalSize = totalSize;
    this._typeID = typeID;
    this._offset = offset;
    this._games = games;
  }

  Game.fromJson(Map<String, dynamic> json) {
    _totalSize = json['total_size'];
    _typeID = json['type_id'];
    _offset = json['offset'];

    if (json['games'] != null) {
      _games = <GameModel>[];
      json['games'].forEach((v) {
        _games.add(GameModel.fromJson(v));
      });
    }
  }
}

class GameModel {
  int? id;
  String? name;
  String? genre;
  String? description;
  int? price;
  int? stars;
  String? image;
  String? location;
  String? created;
  String? updated;
  int? typeID;

  GameModel(
      {this.typeID,
      this.location,
      this.name,
      this.created,
      this.description,
      this.id,
      this.image,
      this.price,
      this.genre,
      this.stars,
      this.updated});

  GameModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    genre = json['genre'];
    description = json['description'];
    price = json['price'];
    stars = json['stars'];
    image = json['image'];
    location = json['location'];
    created = json['created'];
    updated = json['updated'];
    typeID = json['type_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "genre": this.genre,
      "description": this.description,
      "price": this.price,
      "stars": this.stars,
      "image": this.image,
      "location": this.location,
      "created": this.created,
      "updated": this.updated,
      "typeID": this.typeID,
    };
  }
}
