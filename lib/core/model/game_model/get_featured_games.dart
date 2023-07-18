class FeaturedGame {
  final int id;
  final int gameId;
  final DateTime activeFrom;
  final DateTime expiresOn;
  final Game game;

  FeaturedGame({
    required this.id,
    required this.gameId,
    required this.activeFrom,
    required this.expiresOn,
    required this.game,
  });

  factory FeaturedGame.fromJson(Map<String, dynamic> json) {
    return FeaturedGame(
      id: json['id'] as int,
      gameId: json['gameId'] as int,
      activeFrom: DateTime.parse(json['activeFrom'] as String),
      expiresOn: DateTime.parse(json['expiresOn'] as String),
      game: Game.fromJson(json['game'] as Map<String, dynamic>),
    );
  }
}

class Game {
  final int id;
  final String name;
  final String detail;
  final int prize;
  final double? ratingsAverage;
  final int? ratingsQuantity;
  final String rules;
  final String video;
  final List<String> images;
  final String otherDetails;

  Game({
    required this.id,
    required this.name,
    required this.detail,
    required this.prize,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.rules,
    required this.video,
    required this.images,
    required this.otherDetails,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      id: json['id'] as int,
      name: json['name'] as String,
      detail: json['detail'] as String,
      prize: json['prize'] as int,
      ratingsAverage: json['ratingsAverage'] as double?,
      ratingsQuantity: json['ratingsQuantity'] as int?,
      rules: json['rules'] as String,
      video: json['video'] as String,
      images: List<String>.from(json['images'] as List<dynamic>),
      otherDetails: json['otherDetails'] as String,
    );
  }
}
