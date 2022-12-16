class Player {
  final String playerName;
  // final String team;
  final int age;
  final String position;
  final String number;

  const Player({
    required this.playerName,
    // required this.team,
    required this.age,
    required this.position,
    required this.number,
  });

  static Player fromJson(Map<String, dynamic> json) {
    return Player(
        playerName: json["playername"],
        // team: json["team"],
        age: json["age"],
        position: json["position"],
        number: json["number"]);
  }
}

class Players {
  final List<Player> playerslist;

  const Players({required this.playerslist});
}
