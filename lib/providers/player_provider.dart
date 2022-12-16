import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/player.dart';
import 'dart:convert';

class PlayerProvider with ChangeNotifier {
  Player? _player;
  List<Player>? _players;

  PlayerProvider() {
    setPlayer();
  }

  Player? get getPlayer => _player;
  List<Player>? get getPlayers => _players;

  Future<void> setPlayer() async {
    String jsonString = await rootBundle.loadString('assets/json/data.json');
    final jsonResponse = json.decode(jsonString);

    _players = jsonResponse['player'].map<Player>((player) {
      return Player.fromJson(player);
    }).toList();

    _player = Player.fromJson(jsonResponse['player'][0]);
    notifyListeners();
  }
}
