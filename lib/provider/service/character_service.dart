import 'dart:convert';
import 'dart:io';
import 'package:flutter_app/provider/model/character.dart';
import 'package:http/http.dart' as http;

class CharacterService {
  final String baseUrl = "https://rickandmortyapi.com/api";

  Future<List<Character>> getByName(String name) async {
    final http.Response response =
        await http.get(Uri.parse('$baseUrl/character/?name=$name'));

    if (response.statusCode != HttpStatus.ok) {
      return [];
    }

    final jsonResponse = json.decode(response.body);
    final List characters = jsonResponse['results'];

    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }

  Future<List<Character>> getCharacters(int page) async {
    final http.Response response =
        await http.get(Uri.parse('$baseUrl/character/?page=$page'));

    if (response.statusCode != HttpStatus.ok) {
      return [];
    }

    final jsonResponse = json.decode(response.body);
    final List characters = jsonResponse['results'];

    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
