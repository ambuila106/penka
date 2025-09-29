class Team {
  final String name;
  final String flag;
  final int score;

  Team({
    required this.name,
    required this.flag,
    required this.score,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      name: json['name'] as String,
      flag: json['flag'] as String,
      score: json['score'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'flag': flag,
      'score': score,
    };
  }
}

class Match {
  final int id;
  final Team leftTeam;
  final Team rightTeam;
  final String status;

  Match({
    required this.id,
    required this.leftTeam,
    required this.rightTeam,
    required this.status,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      id: json['id'] as int,
      leftTeam: Team.fromJson(json['leftTeam'] as Map<String, dynamic>),
      rightTeam: Team.fromJson(json['rightTeam'] as Map<String, dynamic>),
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'leftTeam': leftTeam.toJson(),
      'rightTeam': rightTeam.toJson(),
      'status': status,
    };
  }
}